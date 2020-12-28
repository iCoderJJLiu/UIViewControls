//
//  UILabelVC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2020/12/28.
//

#import "UILabelVC.h"

@interface UILabelVC ()

@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)NSMutableAttributedString *string;
@end

@implementation UILabelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.string = [[NSMutableAttributedString alloc] initWithString:@"我去。。。。这么短的么？？？？还是不够长，文字到底要多长啊!!!!!!!!!!!!!!!~~~~~~"];
    
    [self setRichText];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 300)];
    self.label.text = [self.string string];
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont systemFontOfSize:25];
    self.label.backgroundColor = [UIColor grayColor];

    // numberOfLines属性用来显示行数，如果为0，则表示会自动换行
    self.label.numberOfLines = 0;

    // textAlignment: 标签中内容的对齐方式
    // NSTextAlignmentCenter：文字居中
    // NSTextAlignmentRight：文字右对齐
    // NSTextAlignmentLeft：文字左对齐
    self.label.textAlignment = NSTextAlignmentCenter;

    // 标签是否可用，默认是YES，决定了label的绘制方式，将它设置为NO会是文本变暗
    // 设置为NO时，设置颜色值是无效的
    // self.label.enabled = NO;

    // 标签是否高亮显示，默认为NO
    self.label.highlighted = NO;

    // 标签高亮显示时的文本颜色
    self.label.highlightedTextColor = [UIColor orangeColor];

    // 设置标签文字过长时的显示格式，默认是最后截断尾巴，用...代替
    self.label.lineBreakMode = NSLineBreakByTruncatingTail;

    // 标签阴影
    self.label.shadowColor = [UIColor blackColor];

    // 标签阴影的偏移
    self.label.shadowOffset = CGSizeMake(2, 3);

    // 如果adjustsFontSizeToFitWidth属性设置为YES，这个属性就来控制文本基线的行为
    self.label.baselineAdjustment = UIBaselineAdjustmentNone;

    // 默认NO,如果文本的长度超出了label的宽度，则缩小文本的字体大小来让文本完全显示
    self.label.adjustsFontSizeToFitWidth = YES;

    // 是否响应用户事件
    self.label.userInteractionEnabled = YES;

    // minimumScaleFactor 设置字体可缩小的最小比例 （值在 0～1.0之间 默认为0.0）
    // 常与adjustsFontSizeToFitWidth一起使用来控制缩小的最小比例
    self.label.minimumScaleFactor = 0.5;

    // allowsDefaultTighteningForTruncation 截断是否紧缩文字，默认为NO
    self.label.allowsDefaultTighteningForTruncation = NO;

    // preferredMaxLayoutWidth 支持基于约束的布局（自动布局）
    // 如果非零，则在确定多行标签的-intrinsicContentSize时使用，设置preferredLayoutWidth后需要重新计算并布局界面
    self.label.preferredMaxLayoutWidth = 80;

    // 字体自动缩小的最小字体大小
    self.label.minimumScaleFactor = 14;

    // self
    self.label.adjustsFontSizeToFitWidth = YES;

    [self.view addSubview:self.label];
}

- (void)setRichText{
    // 设置部分字体大小(前两个字)大小为20
    [self.string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20.0f] range:NSMakeRange(0, 2)];
    
    // 设置部分字体颜色(第三个字开始的后三个字) 设为红色
    [self.string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 3)];
    
    // 设置部分位置的背景颜色（第五个位置开始的后两个字）设为黄色
    [self.string addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(5, 2)];
    
    // 给部分文字添加下划线(第九个文字开始的后三个字)设置下划线
    [self.string addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(9, 3)];
    
    // 添加中间删除线(第11个开始的后一个字)设置中间删除线
    [self.string addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(11, 4)];
    
    // 添加字体的类型(第十五个开始的后七个字)设置字体的类型
    [self.string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:13]  range:NSMakeRange(15, 7)];
    
    // 空心字，文字边框描述文字内部为空(从第二十五开始的后三个字)设为空心字 空心字宽2 边的颜色为灰色
    [self.string addAttribute:NSStrokeWidthAttributeName value:@2 range:NSMakeRange(25, 3)];
    [self.string addAttribute:NSStrokeColorAttributeName value:[UIColor grayColor] range:NSMakeRange(25, 3)];
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 5;//模糊度
    shadow.shadowColor = [UIColor yellowColor];
    shadow.shadowOffset = CGSizeMake(1, 3);
    NSDictionary *attrsDic2 = @{NSShadowAttributeName: shadow,NSVerticalGlyphFormAttributeName: @(0), NSForegroundColorAttributeName: [UIColor magentaColor]};
    // 设置阴影(第三十个开始的后三个)
    [self.string addAttributes:attrsDic2 range:NSMakeRange(30, 3)];
    
    NSShadow *shadow01 = [[NSShadow alloc]init];
    shadow01.shadowBlurRadius = 5;//模糊度
    shadow01.shadowColor = [UIColor magentaColor];
    shadow01.shadowOffset = CGSizeMake(1, 3);
    // 设置文本扁平化(第三十三位置开始的后四个)
    [self.string addAttributes:@{NSShadowAttributeName: shadow01, NSVerticalGlyphFormAttributeName: @(0), NSExpansionAttributeName: @1} range:NSMakeRange(33, 4)];
    
    // 设置字体的倾斜度(第三十七位置开始的后三个)
    NSShadow *shadow02 = [[NSShadow alloc]init];
    shadow02.shadowBlurRadius = 5;//模糊度
    shadow02.shadowColor = [UIColor blueColor];
    shadow02.shadowOffset = CGSizeMake(1, 3);
    [self.string addAttributes:@{NSShadowAttributeName: shadow02, NSVerticalGlyphFormAttributeName: @(0), NSObliquenessAttributeName: @1} range:NSMakeRange(37, 3)];
    
    //段落格式
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 2;//行间距
    paragraph.headIndent = 10;//头部缩进，相当于左padding
    paragraph.tailIndent = -10;//相当于右padding
    paragraph.lineHeightMultiple = 1.5;//行间距是多少倍
    paragraph.firstLineHeadIndent = 5;//指定段落开始的缩进，首行头缩进
    paragraph.headIndent = 10;//调整全部文字的缩进
    paragraph.paragraphSpacingBefore = 20;//段落之前的间距
    paragraph.paragraphSpacing = 20;//段落后面的间距
    paragraph.alignment = NSTextAlignmentLeft;//对齐方式
    /// 添加段落设置
    [self.string addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, self.string.length)];
    
    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    [self.string addAttribute:NSLinkAttributeName value:url range:NSMakeRange(0, self.string.length)];
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
