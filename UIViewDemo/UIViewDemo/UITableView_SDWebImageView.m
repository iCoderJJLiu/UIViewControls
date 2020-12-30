//
//  UITableView_SDWebImageView.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2020/12/30.
//

#import "UITableView_SDWebImageView.h"
#import "UIImageView+WebCache.h"
#import <AFNetworking.h>
#import "MovieModel.h"
@interface UITableView_SDWebImageView ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *arrayData;
@property(nonatomic, strong)UIBarButtonItem *loadDataButton;
@property(nonatomic, strong)UIBarButtonItem *editButton;
@property(nonatomic, strong)UIToolbar *toolBar;

@end

//@interface MovieModel ()
//
//// 数据源
//@property(nonatomic, copy)NSString *movieName;
//@property(nonatomic, copy)NSString *movieImageUrl;
//
//
//@end


@implementation UITableView_SDWebImageView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.tableView];
    
    self.arrayData = [[NSMutableArray alloc] init];
    self.loadDataButton = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadDataFromNetWork)];
    
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 50)];
    self.toolBar.barTintColor = [UIColor orangeColor];
    [self.toolBar setItems:[[NSArray alloc] initWithObjects:self.loadDataButton, nil]];
    [self.view addSubview:self.toolBar];
}


// 下载数据
- (void)loadDataFromNetWork{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];

    NSArray *kindArray = [NSArray arrayWithObjects:@"热门",@"悬疑",@"喜剧", nil];
    static int counter = 0;
    NSString *netPath = [NSString stringWithFormat:@"https://movie.douban.com/j/search_subjects?type=movie&tag=%@&page_limit=50&page_start=0", kindArray[counter]];

    counter ++;
    if (counter >= 3) {
        counter = 0;
    }

    // 中文转码
    NSString *standardPath = [netPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"转码后%@",standardPath);
    
    [session GET:standardPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //
        NSLog(@"下载成功");
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"dictionary = %@", responseObject);

            // 解析数据
            [self parseData:responseObject];
        }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //
            NSLog(@"下载失败");

        }];
}

// 解析数据
- (void)parseData:(NSDictionary *)dictionaryData{
    NSArray *arrSubjects = [dictionaryData objectForKey:@"subjects"];

    for (NSDictionary *dicMovie in arrSubjects) {
        NSString *title = [dicMovie objectForKey:@"title"];
        NSString *imageURL = [dicMovie objectForKey:@"cover"];

        MovieModel *model = [[MovieModel alloc] init];
        model.movieName = title;
        model.movieImageUrl = imageURL;

        [self.arrayData addObject:model];
    }

    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSString *strId = @"reuseId";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:strId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strId];
    }

    MovieModel *model = self.arrayData[indexPath.row];
    cell.textLabel.text = model.movieName;

    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.movieImageUrl] placeholderImage:[UIImage imageNamed:@""]];

    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
