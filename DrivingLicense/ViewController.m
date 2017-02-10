//
//  ViewController.m
//  DrivingLicense
//
//  Created by #incloud on 17/1/17.
//  Copyright © 2017年 #incloud. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UITabBarController *contentTabBarController;

@end

@implementation ViewController

-(UITabBarController *)contentTabBarController
{
    if (!_contentTabBarController)
    {
        _contentTabBarController = [[UITabBarController alloc] init];
    }
    return _contentTabBarController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
