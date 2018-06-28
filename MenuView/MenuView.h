//
//  MenuView.h
//  YJDUIDemo
//
//  Created by lushangshu on 2018/6/26.
//  Copyright © 2018年 lushangshu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIView+Gradient.h"
#import "YJDUIDemo-Swift.h"
@protocol YJDMenuDelegate <NSObject>

- (void)didSelectRowAtIndex:(NSInteger)index Title:(NSString *)title Image:(NSString *)image;

@end

@interface MenuView : UIView <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UIView *titleView;
@property(nonatomic,weak) id <YJDMenuDelegate>delegate;
@property(nonatomic,strong) UIView *coverView;
@property(copy) NSArray *cellLabel;

+(void)showMenuinViewController:(UIViewController *)viewController;


@end
