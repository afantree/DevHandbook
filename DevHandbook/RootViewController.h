//
//  RootViewController.h
//  DevHandbook
//
//  Created by 孙超凡 QQ:729397005 on 13-12-4.
//  Copyright (c) 2013年 优米网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView      *_mainTableView;
    NSArray          *_mainArray;
}
@end
