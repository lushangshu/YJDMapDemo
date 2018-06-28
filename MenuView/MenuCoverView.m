//
//  MenuCoverView.m
//  YJDUIDemo
//
//  Created by lushangshu on 2018/6/28.
//  Copyright © 2018年 lushangshu. All rights reserved.
//

#import "MenuCoverView.h"

@implementation MenuCoverView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor lightGrayColor];
        self.alpha = 0.25;// this is commen
    }
    return self;
}

@end
