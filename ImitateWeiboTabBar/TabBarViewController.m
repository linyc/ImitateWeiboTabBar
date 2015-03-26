//
//  TabBarViewController.m
//  test
//
//  Created by CY on 26/3/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()<UIAlertViewDelegate>

@end

@implementation TabBarViewController{
    UIBarButtonItem *_bar1,*_bar2,*_bar3,*_bar4;
    UIButton *_btn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect rect = self.tabBar.frame;

    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:rect];
    toolbar.backgroundColor = [UIColor blackColor];
    
    _bar1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bulb_on_64"] style:UIBarButtonItemStylePlain target:self action:@selector(selectedIndex:)];
    _bar2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"chart_line_64"] style:UIBarButtonItemStylePlain target:self action:@selector(selectedIndex:)];
    _bar3 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"star_64"] style:UIBarButtonItemStylePlain target:self action:@selector(selectedIndex:)];
    _bar4 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"man_64"] style:UIBarButtonItemStylePlain target:self action:@selector(selectedIndex:)];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    toolbar.items = @[_bar1,space,_bar2,space,space,_bar3,space,_bar4];
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn setBackgroundImage:[UIImage imageNamed:@"add_30"] forState:UIControlStateNormal];
    _btn.frame = CGRectMake(rect.size.width/2.0 - 40/2.0, -40/2.0, 40, 40);
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [toolbar addSubview:_btn];
    
    [self.view addSubview:toolbar];
}

-(void)selectedIndex:(UIBarButtonItem*)item
{
    NSArray *arrBar = @[_bar1 ,_bar2, _bar3, _bar4];
    
    NSInteger index = [arrBar indexOfObject:item];
    
    self.selectedIndex = index;
}

-(void)btnClick
{
    //为什么不是45度？我也不明白
    _btn.transform = CGAffineTransformRotate(_btn.transform, 40);
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"点击了中间按钮" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alertView.delegate = self;
    [alertView show];
    
    //do your something...
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    _btn.transform = CGAffineTransformRotate(_btn.transform, -40);
    
    //do your something...
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
