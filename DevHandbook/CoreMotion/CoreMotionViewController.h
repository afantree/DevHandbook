//
//  CoreMotionViewController.h
//  DevHandbook
//
//  Created by 孙超凡 QQ:729397005 on 13-12-27.
//  Copyright (c) 2013年 优米网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreMotionViewController : UIViewController
{
    //加速度
    IBOutlet UILabel   *_accelerationXLabel;
    IBOutlet UILabel   *_accelerationYLabel;
    IBOutlet UILabel   *_accelerationZLabel;
    
    //陀螺仪
    IBOutlet UILabel   *_gyroXLabel;
    IBOutlet UILabel   *_gyroYLabel;
    IBOutlet UILabel   *_gyroZLabel;
    
    //地磁感应
    IBOutlet UILabel   *_magnetometerXLabel;
    IBOutlet UILabel   *_magnetometerYLabel;
    IBOutlet UILabel   *_magnetometerZLabel;
    
    //重力值
    IBOutlet UILabel   *_gravityXLabel;
    IBOutlet UILabel   *_gravityYLabel;
    IBOutlet UILabel   *_gravityZLabel;
    
    //欧拉角
    IBOutlet UILabel   *_eulerAngleXLabel;
    IBOutlet UILabel   *_eulerAngleYLabel;
    IBOutlet UILabel   *_eulerAngleZLabel;
    
    //手机倾斜
    IBOutlet UILabel   *_zThetaLabel;
    IBOutlet UILabel   *_xyThetaLabel;
}
@end
