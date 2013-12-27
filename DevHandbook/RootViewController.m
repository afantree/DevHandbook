//
//  RootViewController.m
//  DevHandbook
//
//  Created by 孙超凡 QQ:729397005 on 13-12-4.
//  Copyright (c) 2013年 优米网. All rights reserved.
//

#import "RootViewController.h"
#import "FontViewController.h"
#import "CIViewController.h"
#import "CoreMotionViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"系统原生设置参考";
    
    _mainArray = [[NSArray alloc] initWithObjects:@"所有字体",@"所有滤镜",@"重力感应", nil];
    //铺上tableVIew
    _mainTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _mainTableView.delegate=self;
    _mainTableView.dataSource=self;
    _mainTableView.bounces=YES;
    _mainTableView.userInteractionEnabled=YES;
    _mainTableView.showsVerticalScrollIndicator = NO;
    _mainTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_mainTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _mainArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            FontViewController* fvc = [FontViewController new];
            [self.navigationController pushViewController:fvc animated:YES];
        }
            break;
        case 1:
        {
            CIViewController* civc = [CIViewController new];
            [self.navigationController pushViewController:civc animated:YES];
        }
            break;
        case 2:
        {
            CoreMotionViewController* cmvc = [[CoreMotionViewController alloc] initWithNibName:@"CoreMotionViewController" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:cmvc animated:YES];
        }
            break;
        default:
            break;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"RootViewController";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType=UITableViewCellAccessoryNone;
	}
	cell.textLabel.text = _mainArray[indexPath.row];
    return cell;
}
@end
