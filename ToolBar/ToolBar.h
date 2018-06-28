//
//  ToolBar.h
//  YJDUIDemo
//
//  Created by lushangshu on 2018/6/27.
//  Copyright © 2018年 lushangshu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface ToolBar : UIView

typedef enum toolBarState{
    SKETCH,
    MEASURE,
    GEOMETRY
} toolBarState;

@property (nonatomic,strong) UIButton *btn1;
@property (nonatomic,strong) UIButton *btn2;
@property (nonatomic,strong) UIButton *btn3;
@property (nonatomic,strong) UIButton *btn4;


-(void)setUpToolBarWithState:(toolBarState)state;
-(void)setUpToolBarWithSupperView:(UIView *)view;

-(void)toolBarAnimation;

@end
