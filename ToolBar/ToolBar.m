//
//  ToolBar.m
//  YJDUIDemo
//
//  Created by lushangshu on 2018/6/27.
//  Copyright © 2018年 lushangshu. All rights reserved.
//

#import "ToolBar.h"

@implementation ToolBar

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
    }
    return self;
}
-(void)setUpToolBarWithState:(toolBarState)state{
    switch (state) {
        case SKETCH:
             
            break;
        case MEASURE:
            
            break;
        case GEOMETRY:
            break;
        default:
            break;
    }
}

-(void)setUpToolBarWithSupperView:(UIView *)view{
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
    [self makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).with.offset(padding.top);
        make.left.equalTo(view.mas_left).with.offset(padding.left);
        make.right.equalTo(view.mas_right).with.offset(padding.right);
        make.height.mas_equalTo(64);
    }];
}
-(void)createSketchToolBar{
    
}
-(void)createMeasureToolBar{
    
}
-(void)createGeometryToolBar{
    
}
-(void)toolBarAnimation{
    
}
@end
