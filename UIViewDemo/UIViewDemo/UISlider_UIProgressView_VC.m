//
//  UISlider_UIProgressView_VC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2020/12/29.
//

#import "UISlider_UIProgressView_VC.h"

@interface UISlider_UIProgressView_VC ()

@property(nonatomic, strong) UISlider *slider;
@property(nonatomic, strong) UIProgressView *progressView;
@property(nonatomic, strong) UILabel *dataLabel;

@end

@implementation UISlider_UIProgressView_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建progressview进度条
    // 进度条的高度是不可以改变的
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(50, 300, UIScreen.mainScreen.bounds.size.width - 100, 10)];
    
    // 设置进度条的风格颜色
    // 默认颜色是蓝色
    // 左侧颜色
    self.progressView.progressTintColor = [UIColor redColor];
    // 右侧颜色
    self.progressView.trackTintColor = [UIColor blackColor];
    
    // 设置进度条的进度值
    // 范围是0 ～ 1
    self.progressView.progress = 0.5;
    
    // 设置进度条的风格
    self.progressView.progressViewStyle = UIProgressViewStyleBar;
    
    [self.view addSubview:self.progressView];
    
    
    
    // 创建滑动条slider
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 300, UIScreen.mainScreen.bounds.size.width - 100, 40)];
    // 设置滑动条最大最小值
    self.slider.maximumValue = 1;
    self.slider.minimumValue = 0;
    // 设置滑动条初始值
    self.slider.value = 0.5;
    // 设置滑动条左边颜色
    self.slider.minimumTrackTintColor = [UIColor blueColor];
    // 设置滑动条右边颜色
    self.slider.maximumTrackTintColor = [UIColor greenColor];
    // 设置滑块儿颜色
    self.slider.thumbTintColor = [UIColor orangeColor];
    // 添加滑动条滑动函数
    [self.slider addTarget:self action:@selector(pressSlider) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
    
    
    // 创建lable
    self.dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, UIScreen.mainScreen.bounds.size.width - 100, 50)];
    self.dataLabel.textAlignment = NSTextAlignmentCenter;
    self.dataLabel.text = @"0.5";
    self.dataLabel.textColor = [UIColor redColor];
    [self.view addSubview:self.dataLabel];
}

- (void)pressSlider{
    self.progressView.progress = self.slider.value;
    NSLog(@"value = %f", self.slider.value);
    self.dataLabel.text = [NSString stringWithFormat:@"%f", self.slider.value];
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
