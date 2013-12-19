//
//  CIViewController.m
//  DevHandbook
//
//  Created by 孙超凡 QQ:729397005 on 13-12-4.
//  Copyright (c) 2013年 优米网. All rights reserved.
//

#import "CIViewController.h"
#import "CIFilterViewController.h"
@interface CIViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray          *_mainArray;
    UITableView      *_mainTableView;
}

@end

@implementation CIViewController
-(void)returnBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
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
    UIBarButtonItem* bi=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(returnBack)];
    self.navigationItem.leftBarButtonItem=bi;
//    UIBarButtonItem* br=[[UIBarButtonItem alloc] initWithTitle:@"分类" style:UIBarButtonItemStylePlain target:self action:@selector(settup)];
//    self.navigationItem.rightBarButtonItem=br;
    
    
    self.navigationItem.title=@"所有滤镜";
    _mainArray = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    
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
    label.text = @"kCICategoryBuiltIn";
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_mainArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CIFilterViewController* cvc = [[CIFilterViewController alloc] init];
    cvc.filterName = _mainArray[indexPath.row];
    [self.navigationController pushViewController:cvc animated:YES];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CIViewController";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
	}
    cell.textLabel.text = _mainArray[indexPath.row];
//	cell.detailTextLabel.text = [UIFont fontNamesForFamilyName:_familyArray[indexPath.section]][indexPath.row];
//    cell.textLabel.font = [UIFont fontWithName:[UIFont fontNamesForFamilyName:_familyArray[indexPath.section]][indexPath.row] size:20.0f];
    return cell;
}
@end
