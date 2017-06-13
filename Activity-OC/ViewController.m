//
//  ViewController.m
//  Activity-OC
//
//  Created by liangzc on 2017/6/12.
//  Copyright © 2017年 xlb. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Activity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)activityDidSelected:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self navigationActivity];
    } else {
        [self hidenActivity];
    }
}

- (IBAction)normalActivityDidSelected:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self activity];
    } else {
        [self hidenActivity];
    }
}

- (IBAction)ActivitWithMessage:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self activityWithMessage:@"正在加载..."];
    } else {
        [self hidenActivity];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
