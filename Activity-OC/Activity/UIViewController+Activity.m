//
//  UIViewController+Activity.m
//  Activity-OC
//
//  Created by liangzc on 2017/6/12.
//  Copyright © 2017年 xlb. All rights reserved.
//

#import "UIViewController+Activity.h"
#import <objc/runtime.h>
#import "Masonry.h"

static CGFloat const    kSpacing = 16.0;
static char  * const    kActivityIndicatorViewKey = "UIActivityIndicatorView";
static char  * const    kActivityMessageLabelKey = "MessageLabel";
static CGFloat const    kTitleViewHeight = 25.0;
static CGFloat const    kBarItemWidth = 52.0;
static CGFloat const    kMessageFontSize = 16.0;
static CGFloat const    kNavigationTitleFontSize = 20.0;

@implementation UIViewController (Activity)

- (UIActivityIndicatorView *)navigationActivity {
    
    UIView *customTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame) - 4 * kSpacing - 2 * kBarItemWidth , kTitleViewHeight)];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:kNavigationTitleFontSize];
    titleLabel.text = self.title;
    [customTitleView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(customTitleView);
        make.height.equalTo(customTitleView);
    }];
    
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [customTitleView addSubview:activity];
    [activity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(customTitleView);
        make.trailing.equalTo(titleLabel.mas_leading).offset(-10);
    }];
    self.navigationItem.titleView = customTitleView;
    
    [activity startAnimating];
    objc_setAssociatedObject(self, &kActivityIndicatorViewKey, activity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return activity;
}

- (UIActivityIndicatorView *)activity {
    
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activity];
    [activity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    [activity startAnimating];
    objc_setAssociatedObject(self, &kActivityIndicatorViewKey, activity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return activity;
}

- (UIActivityIndicatorView *)activityWithMessage:(NSString *)message {
    
    UILabel *messageLabel = [UILabel new];
    messageLabel.textColor = [UIColor darkGrayColor];
    messageLabel.font = [UIFont systemFontOfSize:kMessageFontSize];
    messageLabel.text = message;
    [self.view addSubview:messageLabel];
    [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(30);
    }];
    objc_setAssociatedObject(self, &kActivityMessageLabelKey, messageLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return [self activity];
}

- (void)hidenActivity {
    UIActivityIndicatorView *activity = objc_getAssociatedObject(self, &kActivityIndicatorViewKey);
    [activity stopAnimating];
    [activity removeFromSuperview];
    activity = nil;
    
    UILabel *messageLabel = objc_getAssociatedObject(self, &kActivityMessageLabelKey);
    messageLabel.hidden = YES;
    [messageLabel removeFromSuperview];
    messageLabel = nil;
}
- (BOOL)isActivity {
    UIActivityIndicatorView *activity = objc_getAssociatedObject(self, &kActivityIndicatorViewKey);
    return activity.isAnimating;
}

@end
