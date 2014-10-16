//
//  CoreMotionViewController.m
//  DevHandbook
//
//  Created by 孙超凡 QQ:729397005 on 13-12-27.
//  Copyright (c) 2013年 优米网. All rights reserved.
//

#import "CoreMotionViewController.h"
#import <CoreMotion/CoreMotion.h>
@interface CoreMotionViewController ()

@end

@implementation CoreMotionViewController
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
-(BOOL)canBecomeFirstResponder {
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIBarButtonItem* bi=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(returnBack)];
    self.navigationItem.leftBarButtonItem=bi;
    self.navigationItem.title=@"重力感应";

    CMMotionManager *motionManager = [[CMMotionManager alloc] init];
    motionManager.accelerometerUpdateInterval = 0.2f;
    motionManager.gyroUpdateInterval = 0.2f;
    motionManager.magnetometerUpdateInterval = 0.2f;
    motionManager.deviceMotionUpdateInterval = 0.2f;

    [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        CMAccelerometerData *newestAccel = motionManager.accelerometerData;
        double accelerationX = newestAccel.acceleration.x;
        double accelerationY = newestAccel.acceleration.y;
        double accelerationZ = newestAccel.acceleration.z;
        //NSLog(@"Accelerometer = (%f,%f,%f)",accelerationX,accelerationY,accelerationZ);
        
        _accelerationXLabel.text = [NSString stringWithFormat:@"%0.3f",accelerationX];
        _accelerationYLabel.text = [NSString stringWithFormat:@"%0.3f",accelerationY];
        _accelerationZLabel.text = [NSString stringWithFormat:@"%0.3f",accelerationZ];
    }];
    [motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
        _gyroXLabel.text = [NSString stringWithFormat:@"%0.3f",gyroData.rotationRate.x];
        _gyroYLabel.text = [NSString stringWithFormat:@"%0.3f",gyroData.rotationRate.y];
        _gyroZLabel.text = [NSString stringWithFormat:@"%0.3f",gyroData.rotationRate.z];
    }];
    [motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        double gravityX = motion.gravity.x;
        double gravityY = motion.gravity.y;
        double gravityZ = motion.gravity.z;
        _gravityXLabel.text = [NSString stringWithFormat:@"%0.3f",gravityX];
        _gravityYLabel.text = [NSString stringWithFormat:@"%0.3f",gravityY];
        _gravityZLabel.text = [NSString stringWithFormat:@"%0.3f",gravityZ];
        
        _eulerAngleXLabel.text = [NSString stringWithFormat:@"%0.3f",motion.attitude.roll];
        _eulerAngleYLabel.text = [NSString stringWithFormat:@"%0.3f",motion.attitude.pitch];
        _eulerAngleZLabel.text = [NSString stringWithFormat:@"%0.3f",motion.attitude.yaw];

        double zTheta = atan2(gravityZ,sqrtf(gravityX*gravityX+gravityY*gravityY))/M_PI*180.0;
        double xyTheta = atan2(gravityX,gravityY)/M_PI*180.0;
        _zThetaLabel.text = [NSString stringWithFormat:@"%0.3f",zTheta];
        _xyThetaLabel.text = [NSString stringWithFormat:@"%0.3f",xyTheta];
        
        //NSLog(@"zTheta = %f,xyTheta = %f",zTheta,xyTheta);
    }];
    [motionManager startMagnetometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMMagnetometerData *magnetometerData, NSError *error) {
        _magnetometerXLabel.text = [NSString stringWithFormat:@"%0.3f",magnetometerData.magneticField.x];
        _magnetometerYLabel.text = [NSString stringWithFormat:@"%0.3f",magnetometerData.magneticField.y];
        _magnetometerZLabel.text = [NSString stringWithFormat:@"%0.3f",magnetometerData.magneticField.z];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
