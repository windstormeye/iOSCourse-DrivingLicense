//
//  userPageViewController.m
//  DrivingLicense
//
//  Created by #incloud on 17/2/11.
//  Copyright © 2017年 #incloud. All rights reserved.
//

#define SCREEM_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEM_WIDTH [[UIScreen mainScreen] bounds].size.width

#import "userPageViewController.h"

@interface userPageViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

static NSString *identifierCell = @"identify";

@implementation userPageViewController {
    CGFloat middleUnderViewMaxY;
}
- (UIScrollView *)scrollView {
    if (!_scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:255/255.0 green:140/255.0 blue:0/255.0 alpha:1.0];
    
    // 隐藏navigationBar底部分割线
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView=(UIImageView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        imageView2.hidden=YES;
                    }
                }
            }
        }
    }
    
    [self initWithScrollView];
    [self.view addSubview:self.scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithScrollView {
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEM_WIDTH, SCREEM_HEIGHT)];
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEM_WIDTH, SCREEM_HEIGHT * 0.2)];
    [tempView addSubview:contentView];
    contentView.backgroundColor = [UIColor colorWithRed:255/255.0 green:140/255.0 blue:0/255.0 alpha:1.0];
    
    UIImageView *userImgView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEM_WIDTH - 60) / 2, 0, 60, 60)];
    [contentView addSubview:userImgView];
    userImgView.clipsToBounds = YES;
    userImgView.layer.cornerRadius = userImgView.frame.size.width / 2;
    userImgView.image = [UIImage imageNamed:@"user"];
   
    UIView *middleViewUnderView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(contentView.frame), SCREEM_WIDTH, 40)];
    middleUnderViewMaxY = CGRectGetMaxY(middleViewUnderView.frame);
    middleViewUnderView.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0];
    [tempView addSubview:middleViewUnderView];
    
    CGFloat middleViewWidth = SCREEM_WIDTH * 0.8;
    CGFloat middleViewHeight = 50;
    UIView *middleView  = [[UIView alloc] initWithFrame:CGRectMake((SCREEM_WIDTH - middleViewWidth) / 2, CGRectGetMaxY(contentView.frame) - middleViewHeight / 2, middleViewWidth, middleViewHeight)];
    middleView.clipsToBounds = YES;
    middleView.layer.cornerRadius = 3;
    middleView.backgroundColor = [UIColor whiteColor];
    middleView.alpha = 0.8;
    [tempView addSubview:middleView];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(middleViewUnderView.frame), SCREEM_WIDTH, SCREEM_HEIGHT * 0.4) collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifierCell];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [tempView addSubview:self.collectionView];
    
    tempView.frame = CGRectMake(0, 0, SCREEM_WIDTH, CGRectGetMaxY(self.collectionView.frame));
    [self.scrollView addSubview:tempView];
    self.scrollView.contentSize = tempView.frame.size;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
//item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

// item大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEM_WIDTH * 0.24,SCREEM_WIDTH * 0.24);
}

//定义每个item 的 margin 边缘
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, SCREEM_WIDTH * 0.1, 20, SCREEM_WIDTH * 0.1);//分别为上、左、下、右
}

//每个section中不同的行之间的行间距

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //重用
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierCell forIndexPath:indexPath];
    cell.backgroundColor =  [UIColor whiteColor];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.size.width / 6, 0, cell.frame.size.width / 1.5, cell.frame.size.width / 1.5)];
    imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long)indexPath.row]];
    [cell.contentView addSubview:imgView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imgView.frame), cell.frame.size.width, cell.frame.size.height - imgView.frame.size.height)];
    [cell.contentView addSubview:titleLabel];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:12];
    switch (indexPath.row)
    {
        case 0:
            titleLabel.text = @"实时停车场";
            break;
        case 1:
            titleLabel.text = @"违章高发地";
            break;
        case 2:
            titleLabel.text = @"尾号限行";
            break;
        case 3:
            titleLabel.text = @"今日油价";
            break;
        case 4:
            titleLabel.text = @"全国油站油价";
            break;
        case 5:
            titleLabel.text = @"车系查询";
            break;
    }
    
    return cell;
    
    //    此处能看处 虽然都是继承于UIScrollview但是，还是有细微的不同的。
    //    UICollectionViewCell是没有textLabel的等 UILabel的属性的。自定义有更大的灵活性。
    
}

@end
