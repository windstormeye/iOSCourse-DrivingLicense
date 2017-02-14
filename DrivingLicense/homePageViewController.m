//
//  homePageViewController.m
//  DrivingLicense
//
//  Created by #incloud on 17/2/11.
//  Copyright © 2017年 #incloud. All rights reserved.
//

#import "homePageViewController.h"

@interface homePageViewController ()

@end

@implementation homePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:255/255.0 green:140/255.0 blue:0/255.0 alpha:1.0];
    UIView *titileView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEM_WIDTH * 0.4, self.navigationController.navigationBar.frame.size.height * 0.8)];
    titileView.backgroundColor = [UIColor clearColor];
    UIImageView *titleImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, titileView.frame.size.width, titileView.frame.size.height)];
    titleImg.image = [UIImage imageNamed:@"titileImage"];
    [titileView addSubview:titleImg];
    self.navigationItem.titleView = titileView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
