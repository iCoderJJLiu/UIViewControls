//
//  UICollectionViewVC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2021/1/7.
//

#import "UICollectionViewVC.h"

#define screenWidth UIScreen.mainScreen.bounds.size.width
#define screenHeight UIScreen.mainScreen.bounds.size.height


@interface UICollectionViewVC ()<UICollectionViewDelegate, UICollectionViewDataSource>


// 布局参数对象UICollectionViewFlowLayout，正是通过它，我们才实现了UICollectionView各式各样的布局

// 系统提供了两个UICollectionView的布局类
// UICollectionViewLayout是一个抽象类，在自定义布局的时候可以继承此类，并在此基础上设置布局信息
// UICollectionViewFlowLayout 继承于UICollectionViewLayout，是系统写好的布局类，该类为我们提供了一个简单的布局样式。假如我们只需要一个特别简单的网格布局或者流水布局，可以直接使用它。
@property(nonatomic, strong) UICollectionViewFlowLayout *layout;


// UICollectionView继承自UIScrollView，可以根据需要自定义各种各样复杂的布局
// 遵循两个协议，
@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation UICollectionViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建collectionView视图
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    // 使用UICollectionViewFlowLayout创建collectionview
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // 注册cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    // 注册headercell
    [self.collectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerCell"];
    
    // 注册footercell
    [self.collectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerCell"];
    self.collectionView.backgroundColor = [UIColor systemPurpleColor];
    
    [self.view addSubview:self.collectionView];
}

#pragma dataSource

// 返回指定区(section)包含的数据源条目数，该方法必须实现
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

// 返回collectionview中区section的个数，如果没有实现该方法，将默认返回1
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

// 返回某个indexpath对应的cell，该方法必须实现
// 创建和复用cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor redColor];
    } else if (indexPath.section == 1){
        cell.backgroundColor = [UIColor greenColor];
    } else if (indexPath.section == 2){
        cell.backgroundColor = [UIColor blueColor];
    } else {
        cell.backgroundColor = [UIColor orangeColor];
    }
    
    return cell;
}

// 定义需要显示的headerView UI，因为UICOllectionView的headerView是复用的
// 返回headerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *supplementaryView;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerCell" forIndexPath:indexPath];
        supplementaryView.backgroundColor = [UIColor redColor];
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerCell" forIndexPath:indexPath];
        supplementaryView.backgroundColor= [UIColor greenColor];
    }
    return supplementaryView;
}

#pragma delegateLayout

// 返回headerView的大小
// 宽0，高10
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(0, 10);
}

// 设置单元格的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(self.view.frame.size.width / 7.0, 100);
}

// 返回footerView的大小
// 宽0，高10
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(0, 10);
}

// 设定指定去的内边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

// 设定指定区内Cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

// 设置指定区内cell的最小行距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

#pragma UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%zi组, %zi行", indexPath.section, indexPath.item);
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
