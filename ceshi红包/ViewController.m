//
//  ViewController.m
//  ceshi红包
//
//  Created by 彭伟macmini on 2016/12/25.
//  Copyright © 2016年 pw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIView *headView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    UIView *headView = [[UIView alloc] init];
    headView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
    self.headView = headView;
    UIImageView *imageView1= [[UIImageView alloc] init];
    imageView1.image = [self createImageWithColor:[UIColor colorWithRed:207/255.0 green:33/255.0 blue:64/255.0 alpha:1.0]];
    imageView1.frame = CGRectMake(0, -500, self.view.frame.size.width, 500);
    [headView addSubview:imageView1];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"random_red_envelope"];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
    [headView addSubview:imageView];
    self.imageView = imageView;

    tableView.tableHeaderView = headView;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 16;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;
    if (offset < 0) {
        //self.headView.frame = CGRectMake(0, 0,self.view.frame.size.width , 300-offset);
        //self.imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300-offset);
       
    }
}

- (UIImage *) createImageWithColor: (UIColor *) color
{
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myImage;
}









@end
