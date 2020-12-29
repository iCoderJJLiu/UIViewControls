//
//  UITabBarVC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2020/12/29.
//

#import "UITabBarVC.h"

@interface UITabBarVC ()<UITabBarControllerDelegate>

@property(nonatomic, strong)UIViewController *firstVC;
@property(nonatomic, strong)UIViewController *secondVC;
@property(nonatomic, strong)UIViewController *thirdVC;
@property(nonatomic, strong)UIViewController *fourVC;
@property(nonatomic, strong)UIViewController *fiveVC;
@property(nonatomic, strong)UIViewController *sixVC;

@property(nonatomic, strong)UIToolbar *toolBar;

@end

@implementation UITabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.firstVC = [[UIViewController alloc] init];
    self.firstVC.view.backgroundColor = [UIColor redColor];
    self.firstVC.title = @"视图一";

    self.secondVC = [[UIViewController alloc] init];
    self.secondVC.view.backgroundColor = [UIColor greenColor];
    self.secondVC.title = @"视图二";
    
    self.thirdVC = [[UIViewController alloc] init];
    self.thirdVC.view.backgroundColor = [UIColor grayColor];
    self.thirdVC.title = @"视图三";
    
    self.fourVC = [[UIViewController alloc] init];
    self.fourVC.view.backgroundColor = [UIColor whiteColor];
    self.fourVC.title = @"视图四";
    
    self.fiveVC = [[UIViewController alloc] init];
    self.fiveVC.view.backgroundColor = [UIColor orangeColor];
    self.fiveVC.title = @"视图五";
    
    self.sixVC = [[UIViewController alloc] init];
    self.sixVC.view.backgroundColor = [UIColor yellowColor];
    self.sixVC.title = @"视图六";
    
    NSArray *vcArray = [NSArray arrayWithObjects:self.firstVC, self.secondVC, self.thirdVC, self.fourVC, self.fiveVC, self.sixVC, nil];
    
    // 将分栏控制器作为根视图控制器
    self.viewControllers = vcArray;
    
    // 当translucent为YES时，UIViewController中self.view 的底部会被tabBar遮挡
    // 设置为NO时，不会被tabBar遮挡
    // 默认是 YES
    self.tabBar.translucent = NO;
    
    // 设置工具栏点击文字图形颜色
    self.tabBar.tintColor = [UIColor redColor];
    
    // 设置工具栏颜色
    self.tabBar.barTintColor = [UIColor whiteColor];
    
    // 设置代理
    self.delegate = self;
    
    [self setImageView];
    [self setToolBar];
}

// 开始编译前调用
- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    NSLog(@"开始编译前调用");
}

// 即将结束前调用
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
    NSLog(@"即将结束");
}

// 已经结束编译
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
    if (changed == YES) {
        NSLog(@"编译前和编译后位置已改变");
    }
    NSLog(@"已经结束");
}

// 选中控制器对象
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"选中控制器对象");
}


- (void)setImageView{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"276962363"]];
    imageView.frame = CGRectMake(0, 30, UIScreen.mainScreen.bounds.size.width, 300);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.firstVC.view addSubview:imageView];
}

- (void)setToolBar{
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 44)];
    // 设置toolBar背景颜色
    self.toolBar.barTintColor = [UIColor orangeColor];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"Send" style:UIBarButtonItemStyleDone target:self action:@selector(sendAction)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(itemAction)];
    
    // 该systemItem展示按钮样式
    // UIBarButtonSystemItemFlexibleSpace为space填充样式
    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [self.toolBar setItems:[[NSArray alloc] initWithObjects:item1,itemSpace,item2, nil]];
    [self.secondVC.view addSubview:self.toolBar];
}

- (void)sendAction{
    NSLog(@"send按钮已经按下");
}

- (void)itemAction{
    NSLog(@"设置按钮已经按下");
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
