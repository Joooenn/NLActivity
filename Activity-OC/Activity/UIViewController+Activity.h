//
//  UIViewController+Activity.h
//  Activity-OC
//
//  Created by liangzc on 2017/6/12.
//  Copyright © 2017年 xlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Activity)

- (UIActivityIndicatorView *)navigationActivity;
- (UIActivityIndicatorView *)activity;
- (UIActivityIndicatorView *)activityWithMessage:(NSString *)message;
- (void)hidenActivity;
- (BOOL)isActivity;

@end
