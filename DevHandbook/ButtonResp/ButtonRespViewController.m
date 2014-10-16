//
//  ButtonRespViewController.m
//  DevHandbook
//
//  Created by 阿凡树 QQ：729397005 on 14-10-16.
//  Copyright (c) 2014年 优米网. All rights reserved.
//

#import "ButtonRespViewController.h"

@interface ButtonRespViewController ()
{
    IBOutlet UILabel *_titleLabel;
}
@end

@implementation ButtonRespViewController
-(void)returnBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    UIBarButtonItem* bi=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(returnBack)];
    self.navigationItem.leftBarButtonItem=bi;
    [super viewDidLoad];
    self.navigationItem.title=@"按钮响应事件";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touchCancel:(UIButton *)sender {
    NSString* str = NSStringFromSelector(_cmd);
    _titleLabel.text = str;
    NSLog(@"%@",str);
}
- (IBAction)touchDown:(UIButton *)sender {
    NSString* str = NSStringFromSelector(_cmd);
    _titleLabel.text = str;
    NSLog(@"%@",str);
}
- (IBAction)touchDownRepeat:(UIButton *)sender {
    NSString* str = NSStringFromSelector(_cmd);
    _titleLabel.text = str;
    NSLog(@"%@",str);
}
- (IBAction)touchDragEnter:(UIButton *)sender {
    NSString* str = NSStringFromSelector(_cmd);
    _titleLabel.text = str;
    NSLog(@"%@",str);
}
- (IBAction)touchDragExit:(UIButton *)sender {
    NSString* str = NSStringFromSelector(_cmd);
    _titleLabel.text = str;
    NSLog(@"%@",str);
}
- (IBAction)touchDragInside:(UIButton *)sender {
    NSString* str = NSStringFromSelector(_cmd);
    _titleLabel.text = str;
    NSLog(@"%@",str);
}
- (IBAction)touchDragOutside:(UIButton *)sender {
    NSString* str = NSStringFromSelector(_cmd);
    _titleLabel.text = str;
    NSLog(@"%@",str);
}
- (IBAction)touchUpInside:(UIButton *)sender {
    NSString* str = NSStringFromSelector(_cmd);
    _titleLabel.text = str;
    NSLog(@"%@",str);
}
- (IBAction)touchUpOutside:(UIButton *)sender {
    NSString* str = NSStringFromSelector(_cmd);
    _titleLabel.text = str;
    NSLog(@"%@",str);
}



@end
