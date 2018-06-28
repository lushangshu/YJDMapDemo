//
//  ViewController.m
//  YJDUIDemo
//
//  Created by lushangshu on 2018/6/26.
//  Copyright © 2018年 lushangshu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <YJDMenuDelegate,AGSGeoViewTouchDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.headBar = [[HeadBarView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:self.headBar];
    
    [self.headBar HeadBarViewLayoutWithSuperView:self.view];
    [self setUpHeadBarButtonActions];
    
    [self setUpMapView];
    self.isSecMapLoaded = NO;
}

-(void)setUpMapView{
    self.mapView = [[AGSMapView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:self.mapView];
    [self.mapView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headBar.mas_bottom).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
    }];
    AGSSpatialReference *sr = [AGSSpatialReference spatialReferenceWithWKID:4490];
    AGSEnvelope *env = [AGSEnvelope envelopeWithXMin:117.85362348365
                                                yMin:24.398242072050003
                                                xMax:118.48276347535
                                                yMax:24.93150561495 spatialReference:sr];
    
    AGSMap *map_new = [[AGSMap alloc] initWithBasemap:[AGSBasemap imageryWithLabelsBasemap]];
    map_new.initialViewpoint =[[AGSViewpoint alloc] initWithTargetExtent:env];
    self.mapView.map = map_new;
    
    _sketchEditor = [[AGSSketchEditor alloc]init];
    self.mapView.sketchEditor = _sketchEditor;
}

//set up Menu bar on the screen top
-(void)showMenu{
    self.menu = [[MenuView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:self.menu];
    [self.menu makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headBar.mas_top);
        make.left.equalTo(self.headBar.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.equalTo(@(kSCREEN_WIDTH/4));
    }];
    self.menu.delegate = self;
    [self.menu setUserInteractionEnabled:YES];
    self.menu.center = CGPointMake(-kSCREEN_WIDTH/2, self.menu.center.y);
    [UIView animateWithDuration:0.4 animations:^{
        self.menu.frame = CGRectMake(0, 0, kSCREEN_WIDTH/2, kSCREEN_HEIGHT);
        //self.bgView.alpha = 0.5;
        
    } completion:^(BOOL finished) {
        //self.userInteractionEnabled = YES;
    }];
    self.cover = [[MenuCoverView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:self.cover];
    [self.cover makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headBar.mas_top);
        make.left.equalTo(self.menu.mas_right);
        make.bottom.equalTo(self.menu.mas_bottom);
        make.right.equalTo(self.headBar.mas_right);
    }];
}

//draw Lines on the map
-(void)drawSketch{
    self.headBar.isSketch = !self.headBar.isSketch;
    
    if(self.headBar.isSketch){
        
        [self.headBar.sketchBtn setBackgroundColor:[UIColor orangeColor]];
        [_sketchEditor startWithGeometry:nil creationMode:AGSSketchCreationModePolyline];
        [self.mapView.interactionOptions setMagnifierEnabled:YES];
    }else{
        [self.headBar.sketchBtn setBackgroundColor:[UIColor whiteColor]];
        [_sketchEditor clearGeometry];
        [_sketchEditor stop];
        
    }
}

//create two buttons on the main screen 
-(void)showMultipleMap{
    _isSecMapLoaded = !_isSecMapLoaded;
    if(_isSecMapLoaded){
        
        [self.mapView remakeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.headBar.mas_bottom).with.offset(0);
            make.left.equalTo(self.view.mas_left).with.offset(0);
            make.right.equalTo(self.view.centerX);
            make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
        }];
        
        self.secMapView = [[AGSMapView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        
        [self.view addSubview:self.secMapView];
        [self.secMapView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headBar.mas_bottom).with.offset(0);
            make.left.equalTo(self.mapView.mas_right).with.offset(0);
            make.right.equalTo(self.view.mas_right).with.offset(0);
            make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
        }];
        
        AGSSpatialReference *sr = [AGSSpatialReference spatialReferenceWithWKID:102100];
        AGSEnvelope *env = [AGSEnvelope envelopeWithXMin:10279308.778729 yMin:2495116.003309 xMax:10379257.879667 yMax:2450542.535773 spatialReference:sr];
        AGSMap *map_new = [[AGSMap alloc] initWithBasemap:[AGSBasemap imageryBasemap]];
        map_new.initialViewpoint =[[AGSViewpoint alloc] initWithTargetExtent:env];
        
        //self.mapView.map = map_new;
        self.secMapView.map = map_new;
        self.secMapView.touchDelegate = self;
        self.mapView.touchDelegate = self;
        
        __weak __typeof(self)weakSelf = self;
        self.mapView.viewpointChangedHandler = ^{
           NSLog(@"地图中心点:%@，拉伸层级:%@，旋转角度:%@",weakSelf.mapView.visibleArea.extent.center, @(weakSelf.mapView.mapScale),@(weakSelf.mapView.rotation));
            [weakSelf.secMapView setViewpointCenter:weakSelf.mapView.visibleArea.extent.center completion:^(BOOL finished) {
                
            }];
        };
        
    }else{
        [self.secMapView removeFromSuperview];
        [self.mapView remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headBar.mas_bottom).with.offset(0);
            make.left.equalTo(self.view.mas_left).with.offset(0);
            make.right.equalTo(self.view.mas_right);
            make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
        }];
    }
}
//左侧菜单栏函数回调
- (void)didSelectRowAtIndex:(NSInteger)index Title:(NSString *)title Image:(NSString *)image {
    self.vc = [[PersonalSettingViewController alloc]init];
    [self.navigationController pushViewController:self.vc animated:YES];
    [self.menu removeFromSuperview];
}

#pragma mark -- AGSMapView delegate
-(void)geoView:(AGSGeoView *)geoView didTouchDownAtScreenPoint:(CGPoint)screenPoint mapPoint:(AGSPoint *)mapPoint completion:(void (^)(BOOL))completion{
    completion(NO);
    [self.secMapView setViewpoint:[[AGSViewpoint alloc] initWithCenter:self.mapView.visibleArea.extent.center scale:self.mapView.mapScale] duration:0 curve:AGSAnimationCurveLinear completion:^(BOOL finished) {
    }];
}

#pragma mark -- menuBar button actions
-(void)setUpHeadBarButtonActions{
    [self.headBar.menuBtn addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.headBar.sketchBtn addTarget:self action:@selector(drawSketch) forControlEvents:UIControlEventTouchUpInside];
    [self.headBar.displayMultipleMaps addTarget:self action:@selector(showMultipleMap) forControlEvents:UIControlEventTouchUpInside];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if(touch.view!= self.menu.tableView){
        [UIView animateWithDuration:0.4 animations:^{
            self.menu.frame = CGRectMake(-kSCREEN_WIDTH/2, 0, kSCREEN_WIDTH/2, kSCREEN_HEIGHT);
            //self.bgView.alpha = 0.5;
        } completion:^(BOOL finished) {
            //self.userInteractionEnabled = YES;
            [self.menu removeFromSuperview];
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
