//
//  PageView.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2021/1/4.
//

#import "PageView.h"

@implementation PageView

- (id) initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        /** 页模式 */
        self.pagingEnabled = YES;
        self.pageSize = frame.size;
    }
    return self;
}

- (void)addSubview:(UIView *)view forCurrent:(BOOL)current{
    NSInteger nPage = [self.subviews count];
    
    // 新添加的子页都对应content的某个区域
    view.frame = CGRectMake(nPage * self.pageSize.width, 0, self.pageSize.width, self.pageSize.height);
    nPage ++;
    self.contentSize = CGSizeMake(nPage * self.pageSize.width, self.pageSize.height);
    [super addSubview:view];
    if(current){
        [self setCurrentPage:nPage - 1 animated:NO];
    }
}

/** 设置页面page可见，需要把视图的content的对应部分移到可视区 */
- (void)setCurrentPage:(NSInteger)page animated:(BOOL)animated{
    if(page >= [self.subviews count]){
        return ;
    }
    CGRect rect = CGRectMake(page * self.pageSize.width, 0, self.pageSize.width, self.pageSize.height);
    /** 移到可视区 */
    [self scrollRectToVisible:rect animated:animated];
}

//- (void)setCurrentPage:(NSI)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
