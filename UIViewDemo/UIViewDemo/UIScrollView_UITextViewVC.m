//
//  UIScrollView_UITextViewVC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2021/1/2.
//

#import "UIScrollView_UITextViewVC.h"
#import "UIScrollView+modifyTouchMethod.h"
#define screenWidth UIScreen.mainScreen.bounds.size.width
#define screenHeight UIScreen.mainScreen.bounds.size.height

@interface UIScrollView_UITextViewVC ()<UIScrollViewDelegate, UITextViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UITextView *textView;

@end

@implementation UIScrollView_UITextViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setScrollView];
    
    [self setTextView];
}

- (void)setScrollView{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.backgroundColor = [UIColor clearColor];
    
    // 是否按照整页来滚动视图
    self.scrollView.pagingEnabled = YES;
    
    // 是否可以开启滚动效果
    self.scrollView.scrollEnabled = YES;
    
    // 设置画布的大小
    // 画布显示在滚动视图内，一般小于frame的大小
    self.scrollView.contentSize = CGSizeMake(screenWidth, screenHeight * 6);
    
    // 是否开启边缘弹动效果
    self.scrollView.bounces = YES;
    
    // 是否开启横向弹动效果
    self.scrollView.alwaysBounceHorizontal = YES;
    
    // 是否开启纵向弹动效果
    self.scrollView.alwaysBounceVertical = YES;
    
    // 是否显示横向滚动条
    self.scrollView.showsHorizontalScrollIndicator = YES;
    
    // 是否显示纵向滚动条
    self.scrollView.showsVerticalScrollIndicator = YES;
    
    //
    self.scrollView.contentOffset = CGPointMake(0, 0);
    
    //self.scrollView.userInteractionEnabled = NO;
    
    self.scrollView.delegate = self;

    for (int i = 0; i < 5; i ++) {
        NSString *stringName = [NSString stringWithFormat:@"image%d", i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:stringName]];
        imageView.frame = CGRectMake(0, screenHeight * i, screenWidth, screenHeight);
        [self.scrollView addSubview:imageView];
        imageView.userInteractionEnabled = YES;
    }
    [self.view addSubview:self.scrollView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    NSLog(@"bvogihkghcfguihkjn jhvguyih");
    [[self nextResponder] touchesBegan:touches withEvent:event];
}

// 当滚动视图移动时，调用此函数
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"y = %f", scrollView.contentOffset.y);
}

// 结束拖拽是调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"停止拖拽");
}

// 视图即将开始拖拽时调用此函数
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"视图即将开始拖拽");
}

// 视图即将结束拖拽时调用此函数
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"视图即将结束拖拽");
}

// 视图即将减速时调用函数
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"视图拖拽即将减速");
}

// 视图已经结束减速时调用函数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"视图停止拖拽");
}


// set Text View
- (void)setTextView{
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, screenHeight * 5, screenWidth, screenHeight)];
    self.textView.text = @"http://baidu.com";
    self.textView.font = [UIFont systemFontOfSize:20];
    self.textView.textColor = [UIColor redColor];
    //设置可编辑状态，默认是YES
    //self.textView.editable = NO;
    self.textView.textAlignment = NSTextAlignmentCenter;
    //设置文本为超链接
    //self.textView.dataDetectorTypes = UIDataDetectorTypeLink;
    [self.scrollView addSubview:self.textView];
}

// 即将开始编辑
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSLog(@"即将开始编辑");
    return YES;
}

// 已经开始编辑
- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"已经开始编辑");
}

// 编辑即将结束
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"编辑即将结束");
    return YES;
}

// 编辑已经结束
- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"编辑已经结束");
}

// 文本视图在用户输入新字符或删除现有字符时调用此方法
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    return YES;
}

// 输入的内容已经变化时调用此方法
- (void)textViewDidChange:(UITextView *)textView{
    
}

// 文本视图的选择已更改，就会调用此方法
- (void)textViewDidChangeSelection:(UITextView *)textView{
    
}

// 如果用户点击或长按文本附件，而其image属性不是，则文本视图将调用此方法nil。您可以使用此方法触发一个操作，除了显示与文本内联的文本附件外
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction{
    return YES;
}

// 该方法仅在与URL链接的第一次交互时被调用。例如，当用户希望首次与URL进行交互以显示可以采取的操作列表时，将调用此方法; 如果用户从列表中选择一个打开的动作，则不调用此方法，因为“open”表示与同一个URL的第二个交互
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction{
    return YES;
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
