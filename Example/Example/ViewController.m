//
//  ViewController.m
//  Example
//
//  Created by Bell on 15/10/28.
//  Copyright © 2015年 GreedLab. All rights reserved.
//

#import "ViewController.h"
#import "GRLog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)startLog
{
    GRLog(@"Demo for GRLog");
    GRLogEmergency(@"Demo for GRLogEmergency");
    GRLogAlert(@"Demo for GRLogAlert");
    GRLogCritical(@"Demo for GRLogCritical");
    GRLogError(@"Demo for GRLogError");
    GRLogWarning(@"Demo for GRLogWarning");
    GRLogNotice(@"Demo for GRLogNotice");
    GRLogInfo(@"Demo for GRLogInfo");
    GRLogDebug(@"Demo for GRLogDebug");
    NSLog(@"Demo for NSLog");
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return _tableView;
}

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [GRLog setGRLogLevel:GRLogLevelInfo];
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"GRLog";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = NSLocalizedString(@"日志等级", nil);
        cell.detailTextLabel.text = @"Debug";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = NSLocalizedString(@"日志等级", nil);
        cell.detailTextLabel.text = @"Error";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = NSLocalizedString(@"日志风格", nil);
        cell.detailTextLabel.text = @"NSLog";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = NSLocalizedString(@"日志风格", nil);
        cell.detailTextLabel.text = @"Fprintf";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = NSLocalizedString(@"日志文件", nil);
        cell.detailTextLabel.text = NSLocalizedString(@"关闭", nil);
    } else if (indexPath.row == 5) {
        cell.textLabel.text = NSLocalizedString(@"日志文件", nil);
        cell.detailTextLabel.text = NSLocalizedString(@"开启", nil);
    }
    return cell;
}

#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [GRLog setGRLogLevel:GRLogLevelDebug];
    } else if (indexPath.row == 1) {
        [GRLog setGRLogLevel:GRLogLevelError];
    } else if (indexPath.row == 2) {
        [GRLog setGRLogStyle:GRLogStyleNSLog];
    } else if (indexPath.row == 3) {
        [GRLog setGRLogStyle:GRLogStyleFprintf];
    } else if (indexPath.row == 4) {
        [GRLog EnabelLogFile:NO];
    } else if (indexPath.row == 5) {
        [GRLog EnabelLogFile:YES];
    }
    [self startLog];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
