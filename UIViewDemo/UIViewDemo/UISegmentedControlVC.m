//
//  UISegmentedControlVC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2021/1/4.
//

#import "UISegmentedControlVC.h"

@interface UISegmentedControlVC ()

@property(nonatomic, copy)NSArray *items;
@property(nonatomic, strong)UISegmentedControl *segmentedControl;
@property(nonatomic, strong)UISwitch *swich;
@property(nonatomic, strong)UILabel *label;

@end

@implementation UISegmentedControlVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.items = @[@"按钮1",@"按钮2",@"按钮3",@"按钮4",@"按钮5",@"按钮6"];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:self.items];
    self.segmentedControl.frame = CGRectMake(0, 70, UIScreen.mainScreen.bounds.size.width, 50);
    self.segmentedControl.tintColor = [UIColor blueColor];

    // 设置在点击之后是否恢复原样
    //self.segmentedControl.momentary = YES;
    self.segmentedControl.selectedSegmentIndex = 0;
    
    // 设置指定索引的题目
    [self.segmentedControl setTitle:@"two" forSegmentAtIndex:1];
    
//    // 设置指定索引的图片
//    [self.segmentedControl setImage:[UIImage imageNamed:@"276962363"] forSegmentAtIndex:2];
//
//    // 在指定索引插入一个选项并设置图片
//    [self.segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"image4"] atIndex:2 animated:NO];
    
    // 在指定索引插入一个选项并设置题目
    [self.segmentedControl insertSegmentWithTitle:@"insert" atIndex:3 animated:NO];
    
    // 移除指定索引的选项
    [self.segmentedControl removeSegmentAtIndex:0 animated:0];
    
    // 设置指定索引选项的宽度
    [self.segmentedControl setWidth:70.0 forSegmentAtIndex:2];
    
    // 设置选项偏移量
    [self.segmentedControl setContentOffset:CGSizeMake(10.0, 10.0) forSegmentAtIndex:4];
    
    [self.segmentedControl addTarget:self action:@selector(segmentedValueChange) forControlEvents:UIControlEventValueChanged];
    
    [self.segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.segmentedControl];
    
    
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, UIScreen.mainScreen.bounds.size.width, 50)];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    self.swich = [[UISwitch alloc] initWithFrame:CGRectMake(50, 300, 100, 50)];
    self.swich.on = YES;
    [self.swich addTarget:self action:@selector(changeLabel:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.swich];
}

- (void)changeLabel:(UISwitch *)swich{
    if (swich.on) {
        self.label.text = @"开关状态开启";
    } else {
        self.label.text = @"开关状态关闭";
    }
}

- (void)segmentedValueChange{
    NSLog(@"s546r7t8yihunjhghcfurudu6f76t8y79uonbhvgyctf7");
}

- (void)segmentAction:(UISegmentedControl *)Seg{
    NSInteger index = Seg.selectedSegmentIndex;
    NSLog(@"index %ld", (long)index);
    switch (index) {
        case 0:
            NSLog(@"哈哈哈哈哈哈哈哈哈");
            break;
            
        default:
            break;
    }
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
