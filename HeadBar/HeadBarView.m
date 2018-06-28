//
//  HeadBarView.m
//  YJDUIDemo
//
//  Created by lushangshu on 2018/6/26.
//  Copyright © 2018年 lushangshu. All rights reserved.
//

#import "HeadBarView.h"

@implementation HeadBarView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.frame = CGRectMake(0, 0, kSCREEN_WIDTH, 50);
        self.isSketch = NO;
    }
    return self;
}

-(void)HeadBarViewLayoutWithSuperView:(UIView *)view{
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
    [self makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).with.offset(padding.top);
        make.left.equalTo(view.mas_left).with.offset(padding.left);
        make.right.equalTo(view.mas_right).with.offset(padding.right);
        make.height.mas_equalTo(64);
    }];
    
    [self setUpHeadBarView];
}

-(void)setUpHeadBarView{
    
    //[self setBackgroundColor:[UIColor greenColor]];
    [self setGradientBackgroundWithColors:@[[UIColor greenColor],[UIColor whiteColor]] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    
    _menuBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self addSubview:_menuBtn];
    [_menuBtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).with.offset(5);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self.mas_bottom).with.offset(-5);
    }];
    [_menuBtn setBackgroundColor:[UIColor whiteColor]];
    [_menuBtn setTitle:@"弹出菜单" forState:UIControlStateNormal];
    //[_menuBtn addTarget:self action:@selector(openMenu) forControlEvents:UIControlEventTouchUpInside];
    
    _sketchBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self addSubview:_sketchBtn];
    [_sketchBtn makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-5);
        make.bottom.equalTo(self.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    [_sketchBtn setBackgroundColor:[UIColor whiteColor]];
    [_sketchBtn setTitle:@"绘制多边形" forState:UIControlStateNormal];
    
    _displayMultipleMaps = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self addSubview:_displayMultipleMaps];
    [_displayMultipleMaps makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.sketchBtn.mas_left).with.offset(-10);
        make.bottom.equalTo(self.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    [_displayMultipleMaps setBackgroundColor:[UIColor blueColor]];
    
    _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self addSubview:_btn1];
    [_btn1 makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.displayMultipleMaps.mas_left).with.offset(-10);
        make.bottom.equalTo(self.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    [_btn1 setBackgroundColor:[UIColor lightGrayColor]];
    
    _btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self addSubview:_btn2];
    [_btn2 makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.btn1.mas_left).with.offset(-10);
        make.bottom.equalTo(self.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    [_btn2 setBackgroundColor:[UIColor yellowColor]];
}


-(void)openMenu{
    
}
-(void)btnFunctions{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
