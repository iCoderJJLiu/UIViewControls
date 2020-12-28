//
//  UIPickerViewVC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2020/12/28.
//

#import "UIPickerViewVC.h"

@interface UIPickerViewVC ()<UIPickerViewDelegate, UIPickerViewDataSource>

// UIPickerView是一个很常用的UI控件，有两个很重要的协议，UIPickerViewDelegate和UIPickerViewDataSource
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSMutableArray *yearArray;
@property (nonatomic, strong) NSMutableArray *monthArray;
@property (nonatomic, strong) UILabel *showTextlabel;
@property (nonatomic, copy) NSString *yearString;
@property (nonatomic, copy) NSString *monthString;

@end

@implementation UIPickerViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.yearString = [[NSString alloc] init];
    self.monthString = [[NSString alloc] init];
    
    self.yearArray = [NSMutableArray arrayWithArray:@[@"2017年", @"2018年", @"2019年", @"2020年"]];
    self.monthArray = [NSMutableArray arrayWithArray:@[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月"]];
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 200, self.view.frame.size.width, 200)];
    [self.view addSubview:self.pickerView];
    
    // 设置代理和数据源
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    self.showTextlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 50)];
    self.showTextlabel.textAlignment = NSTextAlignmentCenter;
    self.showTextlabel.textColor = [UIColor orangeColor];
    self.showTextlabel.text = @"请选择年/月/日";
    [self.view addSubview:self.showTextlabel];
    
}

// 该代理方法来判断应该包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// 该代理方法判断指定列应该包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.yearArray.count;
    } else {
        return self.monthArray.count;
    }
}

// 该方法返回的CGFloat值将作为该UIPickerView控件中指定列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return self.view.frame.size.width / 2.0;
}

// 该方法返回的CGFloat值将作为该UIPickerView控件中指定列中列表项的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}

// 该方法返回的NSString值将作为该UIPickerView控件中指定列的列表项的文本标题
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.yearArray[row];
    } else {
        return self.monthArray[row];
    }
}

// 该方法返回该UIPickerView指定列的列表项所使用的UIView控件
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    if (component == 0) {
        label.text = self.yearArray[row];
    } else {
        label.text = self.monthArray[row];
    }
    return label;
}

// 当用户单击选中该UIPickerView控件的指定列的指定列表项时将会激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        self.yearString = self.yearArray[row];
    } else if (component == 1) {
        self.monthString = self.monthArray[row];
    }
    // 修改UILabel的文本值
    self.showTextlabel.text = [NSString stringWithFormat:@"%@ %@", self.yearString, self.monthString];
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
