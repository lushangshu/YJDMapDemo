//
//  ViewController.h
//  YJDUIDemo
//
//  Created by lushangshu on 2018/6/26.
//  Copyright © 2018年 lushangshu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadBarView.h"
#import "Masonry.h"
#import "MenuView.h"
#import "MenuCoverView.h"
#import "YJDUIDemo-Swift.h"
#import <ArcGIS/ArcGIS.h>

@interface ViewController : UIViewController 

@property(nonatomic,strong) HeadBarView *headBar;
@property(nonatomic,copy) NSArray *titleArr;
@property(nonatomic,copy) NSArray *imageArr;
@property(nonatomic,strong) MenuView *menu;
@property(nonatomic,strong) MenuCoverView *cover;

@property(nonatomic,strong) AGSMapView *mapView;
@property(nonatomic,strong) AGSMapView *secMapView;
@property(assign) BOOL isSecMapLoaded;

@property(nonatomic,strong) AGSSketchEditor *sketchEditor;

@property(nonatomic,strong) PersonalSettingViewController *vc; //个人页面

@end

