//
//  MenuView.m
//  YJDUIDemo
//
//  Created by lushangshu on 2018/6/26.
//  Copyright © 2018年 lushangshu. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.tag = 123;
        self.cellLabel = @[@"数据1",@"数据2",@"数据3",@"数据4",@"数据5",@"数据6",@"数据7"];
        self.titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0,0)];
        //[self.titleView setBackgroundColor:[UIColor blueColor]];
        [self.titleView setGradientBackgroundWithColors:@[[UIColor redColor],[UIColor orangeColor]] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
        [self addSubview:self.titleView];
        
        [self.titleView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.top.equalTo(self.mas_top);
            make.width.mas_equalTo(self.mas_width);
            //make.bottom.equalTo(self.mas_top).offset(-64);
            make.height.mas_equalTo(100);
        }];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self setBackgroundColor:[UIColor greenColor]];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self addSubview:self.tableView];
        [self.tableView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.top.equalTo(self.titleView.mas_bottom);
            make.width.mas_equalTo(self.mas_width);
            make.bottom.mas_equalTo(self.mas_bottom);
        }];
        
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self.tableView setGradientBackgroundWithColors:@[[UIColor orangeColor],[UIColor redColor]] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
        
    }
     return self;
}

+(void)showMenuinViewController:(UIViewController *)viewController{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [self.cellLabel objectAtIndex:indexPath.row];
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellLabel.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_delegate respondsToSelector:@selector(didSelectRowAtIndex:Title:Image:)]) {
        [_delegate didSelectRowAtIndex:indexPath.row Title:@"aaaa" Image:@"bbbb"];
    }
}


@end
