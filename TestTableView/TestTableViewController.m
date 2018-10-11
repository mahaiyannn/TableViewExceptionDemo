//
//  TestTableViewController.m
//  TestTableView
//
//  Created by 晨燕 on 2018/10/11.
//  Copyright © 2018 Taobao.com. All rights reserved.
//

#import "TestTableViewController.h"

@interface TestTableViewController ()
@property (nonatomic,assign) NSUInteger numberOfSections;
@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberOfSections = 10;
    self.view.backgroundColor = [UIColor redColor];
    self.tableView.backgroundColor = [UIColor blueColor];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"XXXX"];
    
    UIBarButtonItem* testItem = [[UIBarButtonItem alloc] initWithTitle:@"Test" style:UIBarButtonItemStylePlain target:self action:@selector(testItemClicked:)];
    self.navigationItem.rightBarButtonItem = testItem;
}

- (void)testItemClicked:(id)sender {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self insertRows];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self deleteRows];
    });
    [self.tableView reloadData];
}

- (void)deleteRows {
    @try {
        self.numberOfSections--;
        NSUInteger randRow = arc4random()%self.numberOfSections;
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:randRow inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
        [self.tableView endUpdates];

    }@catch(NSException * e) {
        NSLog(@"%s,%d,%@",__func__,__LINE__,e);
    }
}

- (void)insertRows {

    @try {
        self.numberOfSections++;
        NSUInteger randRow = arc4random()%self.numberOfSections;
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:randRow inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
        [self.tableView endUpdates];

    } @catch(NSException *e) {
        NSLog(@"%s,%d,%@",__func__,__LINE__,e);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfSections;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(arc4random()%self.numberOfSections == indexPath.row) {
        return 0;
    }
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XXXX" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"XXXX"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"title %ld",(long)indexPath.row];
    return cell;
}

@end
