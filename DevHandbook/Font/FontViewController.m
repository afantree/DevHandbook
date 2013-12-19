//
//  FontViewController.m
//  allfont
//
//  Created by 孙超凡 QQ:729397005 on 13-10-23.
//  Copyright (c) 2013年 优米网. All rights reserved.
//

#import "FontViewController.h"

@interface FontViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray          *_familyArray;
    UITableView      *_mainTableView;
}
@end

@implementation FontViewController
-(void)returnBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem* bi=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(returnBack)];
    self.navigationItem.leftBarButtonItem=bi;
    self.navigationItem.title=@"所有字体";
    _familyArray = [UIFont familyNames];
    
    
    //铺上tableVIew
    _mainTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _mainTableView.delegate=self;
    _mainTableView.dataSource=self;
    _mainTableView.bounces=YES;
    _mainTableView.userInteractionEnabled=YES;
    _mainTableView.showsVerticalScrollIndicator = YES;
    _mainTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_mainTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    label.backgroundColor = [UIColor clearColor];
    label.text = _familyArray[section];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _familyArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[UIFont fontNamesForFamilyName:_familyArray[section]] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"FontViewController";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryNone;
	}
    cell.textLabel.text = @"中文测试  abc  ABC  123";
	cell.detailTextLabel.text = [UIFont fontNamesForFamilyName:_familyArray[indexPath.section]][indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:[UIFont fontNamesForFamilyName:_familyArray[indexPath.section]][indexPath.row] size:20.0f];
    return cell;
}
@end
