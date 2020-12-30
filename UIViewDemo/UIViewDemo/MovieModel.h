//
//  MovieModel.h
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2020/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieModel : NSObject

// 数据源
@property(nonatomic, copy)NSString *movieName;
@property(nonatomic, copy)NSString *movieImageUrl;

@end

NS_ASSUME_NONNULL_END
