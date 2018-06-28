//
//  HeadBarView.h
//  YJDUIDemo
//
//  Created by lushangshu on 2018/6/26.
//  Copyright © 2018年 lushangshu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIView+Gradient.h"

@interface HeadBarView : UIView

@property(nonatomic,strong) UIButton *sketchBtn;
@property(assign) BOOL isSketch;

@property(nonatomic,strong) UIButton *displayMultipleMaps;

@property(nonatomic,strong) UIButton *btn1;
@property(nonatomic,strong) UIButton *btn2;
@property(nonatomic,strong) UIButton *btn3;
@property(nonatomic,strong) UIButton *btn4;


@property(nonatomic,strong) UIButton *menuBtn;

-(void)HeadBarViewLayoutWithSuperView:(UIView *)view;
-(void)setUpHeadBarView;
-(void)btnFunctions;

@end
