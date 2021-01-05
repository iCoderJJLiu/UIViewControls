//
//  UIPageControlVC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2021/1/4.
//

#import "UIPageControlVC.h"
#import "PageView.h"
@interface UIPageControlVC ()<UIScrollViewDelegate>

@property(nonatomic, strong)PageView *pageView;
@property(nonatomic, strong)UIPageControl *pageController;
@property(nonatomic, copy)NSString *imageName;

@end

int nImage = 5;

@implementation UIPageControlVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    CGRect frame = self.view.frame;
    self.pageView = [[PageView alloc] initWithFrame:frame];

    self.pageView.delegate = self;
    [self.view addSubview:self.pageView];
    
    frame.origin.y += frame.size.height * 4/5;
    frame.size.height = frame.size.height / 5;
    
    self.pageController = [[UIPageControl alloc] initWithFrame:frame];
    
    // 非当前页的指示器颜色
    self.pageController.pageIndicatorTintColor = [UIColor blueColor];
    // 当前页的指示器颜色
    self.pageController.currentPageIndicatorTintColor = [UIColor greenColor];
    
//    self.pageController.backgroundColor = [UIColor redColor];
    
    [self.view insertSubview:self.pageController aboveSubview:self.pageView];
    
    /** 页面指示器变化时，scroll更新 */
    [self.pageController addTarget:self action:@selector(onChangePage) forControlEvents:UIControlEventValueChanged];
    
    /** 加载图片 */
    for (int i = 0; i < nImage; i ++)
    {
        self.imageName = [[NSString alloc] initWithFormat:@"image%d", i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageName]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = self.pageView.frame;
        [self.pageView addSubview:imageView forCurrent:NO];
    }
    /** 设置页指示器总个数 */
    self.pageController.numberOfPages = [self.pageView.subviews count];
    
}

#pragma 实现协议UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / self.pageView.pageSize.width;
    if(page != self.pageController.currentPage)
    {
        self.pageController.currentPage = page;
    };
    NSLog(@"123456789123456789123456789");
}
- (void)onChangePage
{
    [self.pageView setCurrentPage:self.pageController.currentPage animated:YES];
    NSLog(@"987654321987654321987654321");
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
