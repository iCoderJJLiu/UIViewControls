//
//  PageView.h
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2021/1/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PageView : UIScrollView

@property (nonatomic, assign) CGSize pageSize;

- (void)addSubview:(UIView *)view forCurrent:(BOOL)current;
- (void)setCurrentPage:(NSInteger)page animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
