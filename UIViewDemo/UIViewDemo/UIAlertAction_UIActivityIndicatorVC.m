//
//  UIAlertAction_UIActivityIndicatorVC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2020/12/29.
//

#import "UIAlertAction_UIActivityIndicatorVC.h"

@interface UIAlertAction_UIActivityIndicatorVC ()

@property(nonatomic, strong) UIButton *showAlertVCButton;
@property(nonatomic, strong) UIButton *startIndicatorButton;
@property(nonatomic, strong) UIButton *stopIndicatorButton;

@property(nonatomic, strong) UIAlertController *alertController;
@property(nonatomic, strong) UIAlertAction *defult;
@property(nonatomic, strong) UIAlertAction *cancel;

@property(nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation UIAlertAction_UIActivityIndicatorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.showAlertVCButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.showAlertVCButton.frame = CGRectMake(0, 100, UIScreen.mainScreen.bounds.size.width, 50);
    [self.showAlertVCButton setTitle:@"弹窗显示" forState:UIControlStateNormal];
    [self.showAlertVCButton addTarget:self action:@selector(showAlertActionVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.showAlertVCButton];

    
    self.startIndicatorButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.startIndicatorButton.frame = CGRectMake(0, 200, UIScreen.mainScreen.bounds.size.width, 50);
    [self.startIndicatorButton setTitle:@"开始转圈等待" forState:UIControlStateNormal];
    [self.startIndicatorButton addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startIndicatorButton];
    
    
    self.stopIndicatorButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.stopIndicatorButton.frame = CGRectMake(0, 300, UIScreen.mainScreen.bounds.size.width, 50);
    [self.stopIndicatorButton setTitle:@"停止转圈等待" forState:UIControlStateNormal];
    [self.stopIndicatorButton addTarget:self action:@selector(stopAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.stopIndicatorButton];
    
    // 创建提示器
    // 高度和宽度不可改变
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(UIScreen.mainScreen.bounds.size.width / 2 - 20, UIScreen.mainScreen.bounds.size.height / 2 - 20, 40, 40)];
    // 设定提示器的风格:
    // UIActivityIndicatorViewStyleWhiteLarge: 大白
    // UIActivityIndicatorViewStyleMedium: 中白
    self.activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleMedium;
    [self.view addSubview:self.activityIndicatorView];
    
}

- (void)showAlertActionVC{
    NSLog(@"弹窗显示");
    self.alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"弹窗展示demo" preferredStyle:UIAlertControllerStyleAlert];
    self.defult = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确认按钮已点击");
    }];
    self.cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消按钮已点击");
    }];
    [self.alertController addAction:self.cancel];
    [self.alertController addAction:self.defult];
    [self presentViewController:self.alertController animated:YES completion:nil];
}

- (void)startAnimation{
    NSLog(@"开始转圈");
    [self.activityIndicatorView startAnimating];
    
}

- (void)stopAnimation{
    NSLog(@"停止转圈");
    [self.activityIndicatorView stopAnimating];
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
