//
//  UINavigationVC.m
//  UIViewDemo
//
//  Created by JJ.Liu's mbp on 2020/12/29.
//

#import "UINavigationVC.h"
#import "AppDelegate.h"
@interface UINavigationVC ()

@end

@implementation UINavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UINavigationController *nav = [[UINavigationController alloc] init];
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    window.rootViewController = nav;
    NSLog(@"%@", [UIApplication sharedApplication].windows[0]);
    [window addSubview:self.view];
    NSLog(@"%@", self);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"%@", self.navigationController);
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
