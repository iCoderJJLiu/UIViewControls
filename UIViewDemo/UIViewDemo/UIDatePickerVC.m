//
//  UIDatePickerVC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2021/1/4.
//

#import "UIDatePickerVC.h"

@interface UIDatePickerVC ()<UITextFieldDelegate>

// UIDatePicker封装了UIPickerView，专门用来接受日期、时间和持续时长的输入
@property(nonatomic, strong) UIDatePicker *datePicker;

@property(nonatomic, strong) UITextField *textField;

@end

@implementation UIDatePickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 200, UIScreen.mainScreen.bounds.size.width, 200)];
    self.datePicker.backgroundColor = [UIColor whiteColor];
    
    // 设置地区：zh-中国
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    
    
    // 设置日期选择器模式：日期模式
    // UIDatePickerModeCountDownTimer: 24小时制
    // UIDatePickerModeDate: 日历模式
    // UIDatePickerModeTime: 12小时制
    // UIDatePickerModeDateAndTime: 日历+12小时制
    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    // 设置当前显示时间
    [self.datePicker setDate:[NSDate date] animated:YES];
    
    // 设置可供选择的最小时间：昨天
    NSTimeInterval time = 24 * 60 * 60 * 30 * 12 * 50;// 设置50年 的时间戳值
    self.datePicker.minimumDate = [[NSDate alloc] initWithTimeIntervalSinceNow:- time];
    // 设置可供选择的最大时间：明天
    self.datePicker.maximumDate = [[NSDate alloc] initWithTimeIntervalSinceNow:time];
    
    // 添加事件函数
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.datePicker];
    
    
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 70, UIScreen.mainScreen.bounds.size.width, 70)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.textField];
    
    self.textField.delegate = self;
}

- (void)datePickerValueChanged:(UIDatePicker *)datePicker{
    // 格式化日期后再打印
    NSDate *date = datePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日hh时mm分ss秒"];
    NSLog(@"日期为： %@",[dateFormatter stringFromDate:date]);
    NSLog(@"the date is %@", date);
    
    self.textField.text = [dateFormatter stringFromDate:date];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return NO;
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
