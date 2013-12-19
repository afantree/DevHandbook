//
//  CIFilterViewController.h
//  DevHandbook
//
//  Created by 孙超凡 QQ:729397005 on 13-12-19.
//  Copyright (c) 2013年 优米网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CIFilterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITextView         *_mainTextView;
}
@property (nonatomic, readwrite, retain) NSString *filterName;
@end
