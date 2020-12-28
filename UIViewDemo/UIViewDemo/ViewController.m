//
//  ViewController.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2020/12/28.
//

#import "ViewController.h"
#import "UILabelVC.h"
#import "UIPickerViewVC.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) NSMutableArray *viewNameArray;
@property (nonatomic, strong) NSMutableArray *cellTextArray;
@property (nonatomic, strong) UIViewController *pushedVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _cellTextArray = [[NSMutableArray alloc] initWithObjects:@"UILable相关",@"UIPickerViewVC相关", nil];
    _viewNameArray = [[NSMutableArray alloc] initWithObjects:@"UILabelVC",@"UIPickerViewVC", nil];
    
    // 创建主界面
    _homeTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _homeTableView.delegate = self;
    _homeTableView.dataSource = self;
    [self.view addSubview:_homeTableView];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellTextArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = @"reuseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0.8 alpha:0.7];
    if (_cellTextArray.count > indexPath.row) {
        cell.textLabel.text = [_cellTextArray objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _pushedVC = [[NSClassFromString(_viewNameArray[indexPath.row]) alloc] init];
    [self presentViewController:_pushedVC animated:YES completion:nil];
}

@end
