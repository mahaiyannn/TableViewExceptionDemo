//
//  ViewController.m
//  TestTableView
//
//  Created by 晨燕 on 2018/10/11.
//  Copyright © 2018 Taobao.com. All rights reserved.
//

#import "ViewController.h"
#import "TestTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button setTitle:@"Click!" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    
}

- (void)buttonClicked:(id)sender {
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:[[TestTableViewController alloc] init]];
    [self presentViewController:nav animated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
