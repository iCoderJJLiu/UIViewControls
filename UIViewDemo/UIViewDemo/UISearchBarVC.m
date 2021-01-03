//
//  UISearchBarVC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2021/1/2.
//

#import "UISearchBarVC.h"

@interface UISearchBarVC ()<UISearchBarDelegate>

@property(nonatomic, strong)UISearchBar *searchBar;

@end


@implementation UISearchBarVC

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 75)];
    
    // 搜索框风格
    // UIBarStyleBlack: 黑色搜索框
    // UIBarStyleDefault: 白色搜索框，背景灰色
    self.searchBar.barStyle = UIBarStyleDefault;
    
    // 搜索文本
    NSLog(@"搜索的文本是: %@",self.searchBar.text);
    // 搜索框顶部的提示信息
    self.searchBar.prompt = @"搜索框提示信息";
    // 搜索框占位符
    self.searchBar.placeholder = @"请输入想要搜索内容";
    
    
    // 搜索框右侧是否显示图书按钮 默认为NO
    //self.searchBar.showsBookmarkButton = YES;
    
    // 搜索框右侧是否显示取消按钮 默认为NO
    self.searchBar.showsCancelButton = YES;
    
    // 搜索框右侧是否显示搜索结果按钮 默认为NO
    //self.searchBar.showsSearchResultsButton = YES;
    
    // 搜索结果按钮为选中状态 默认为NO 搭配showsSearchResultsButton使用
    //self.searchBar.searchResultsButtonSelected = YES;
    
    // 设置光标颜色为橘色
    self.searchBar.tintColor = [UIColor orangeColor];
    // 设置搜索框背景颜色为灰色
    //self.searchBar.barTintColor = [UIColor grayColor];
    
    
    // 搜索框风格
    // UISearchBarStyleDefault 默认样式, 和UISearchBarStyleProminent一样
    // UISearchBarStyleProminent 显示背景
    // UISearchBarStyleMinimal 不显示背景，系统自带的背景色无效，自定义的有效
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    
    
    // 是否显示搜索栏的附件选择按钮视图
    self.searchBar.showsScopeBar = YES;
    
    // 选择按钮视图的按钮标题
    self.searchBar.scopeButtonTitles = @[@"One",@"Two",@"Three"];
    
    // 按钮视图的预设值
    self.searchBar.selectedScopeButtonIndex = 1;
    
    // 设置搜索框背景图片
    [self.searchBar setBackgroundImage:[UIImage imageNamed:@"276962363"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    // 设置选择按钮视图的背景图片
    [self.searchBar setScopeBarButtonBackgroundImage:[UIImage imageNamed:@"276962363"] forState:UIControlStateNormal];
    // 设置搜索框文本框的背景图片
//    [self.searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"276962363"] forState:UIControlStateNormal];
    
    // 搜索框中文本框的背景偏移量
//    self.searchBar.searchFieldBackgroundPositionAdjustment = UIOffsetMake(5, 3);
//    // 搜索框中文本框的文本偏移量
//    self.searchBar.searchTextPositionAdjustment = UIOffsetMake(10, 5);
    
    self.searchBar.delegate = self;
    
    [self.view addSubview:self.searchBar];
   
}

#pragma delegate method

// 将要开始编辑文本时会调用该方法，返回 NO 将不会变成第一响应者
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"开始编辑文本");
    return YES;
}

// 开始输入文本会调用该方法
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    searchBar.prompt = @"1.开始编辑文本";
    [searchBar setShowsCancelButton:NO animated:YES]; // 动画效果显示取消按钮
}

// 文字改变前会调用该方法，返回NO则不能加入新的编辑文字
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return YES;
}

// 文本改变会调用该方法（包含clear文本）
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    searchBar.prompt = @"2.在改变文本过程中。。。";
    NSLog(@"文本text：%@", searchText);
}

// 键盘上的搜索按钮点击的会调用该方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    searchBar.prompt = @"3. 点击键盘上的搜索按钮";
}

// 点击取消按钮会调用该方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.prompt = @"4. 点击取消按钮";
    searchBar.text = @"";
    [self.searchBar setShowsCancelButton:NO animated:YES];
    // 如果希望在点击取消按钮调用结束编辑方法需要让加上这句代码
    //[searchBar resignFirstResponder];
}

// 将要结束编辑文本时会调用该方法，返回 NO 将不会释放第一响应者
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return YES;
}

// 结束编辑文本时调用该方法
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
     searchBar.prompt = @"5.已经结束编辑文本";
    [self.searchBar setShowsCancelButton:YES animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.searchBar resignFirstResponder];
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
