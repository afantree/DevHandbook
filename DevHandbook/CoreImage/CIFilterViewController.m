//
//  CIFilterViewController.m
//  DevHandbook
//
//  Created by 孙超凡 QQ:729397005 on 13-12-19.
//  Copyright (c) 2013年 优米网. All rights reserved.
//

#import "CIFilterViewController.h"

@interface CIFilterViewController ()

@end

@implementation CIFilterViewController
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
    
    self.navigationItem.title=_filterName;
    _mainTextView = [[UITextView alloc] initWithFrame:self.view.bounds];
    _mainTextView.editable = NO;
    _mainTextView.text = [NSString stringWithFormat:@"%@", [[CIFilter filterWithName:_filterName] attributes]];
    [self.view addSubview:_mainTextView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
