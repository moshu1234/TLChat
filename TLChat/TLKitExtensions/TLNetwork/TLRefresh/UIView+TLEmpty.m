//
//  UIView+TLEmpty.m
//  TLChat
//
//  Created by 李伯坤 on 2017/7/23.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "UIView+TLEmpty.h"
#import "UIView+Extensions.h"

@implementation UIView (TLEmpty)

- (void)showEmptyViewWithTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
    [label setNumberOfLines:0];
    [label setFont:[UIFont systemFontOfSize:16]];
    [label setTextColor:[UIColor grayColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:title ? title : @"没有请求到相应数据"];
    [self showTipView:label retryAction:nil];
}

- (void)showErrorViewWithTitle:(NSString *)title
{
    [self showErrorViewWithTitle:title retryAction:nil];
}

- (void)showErrorViewWithTitle:(NSString *)title retryAction:(void (^)(id userData))retryAction
{
    [self showErrorViewWithTitle:title userData:nil retryAction:retryAction];
}

- (void)showErrorViewWithTitle:(NSString *)title userData:(id)userData retryAction:(void (^)(id userData))retryAction
{
    UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
    [label setNumberOfLines:0];
    [label setFont:[UIFont systemFontOfSize:16]];
    [label setTextColor:[UIColor grayColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [self showTipView:(label ? label : @"没有请求到相应数据") retryAction:nil];
    [self showTipView:label userData:userData retryAction:retryAction];
}

@end

