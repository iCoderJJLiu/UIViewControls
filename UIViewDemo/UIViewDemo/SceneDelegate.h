//
//  SceneDelegate.h
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2020/12/28.
//

#import <UIKit/UIKit.h>

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

// UIWindow是一种特殊的UIView
// iOS程序启动完成后，创建的第一个视图控件就是UIWindow，接着创建控制器的View，最后将控制器的view添加到UIWindow上
// 没有UIWindow，就不可能看到任何UI界面
@property (strong, nonatomic) UIWindow * window;

@end

