//
//  EarthAroundSun.m
//  UIViewBasic
//
//  Created by Hoàng Tiến on 11/2/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "EarthAroundSun.h"

@implementation EarthAroundSun
{
    NSTimer *timer1;
    NSTimer *timer;
    UIImageView *sun;
    UIImageView *earth;
    UIImageView *moon;
    UIImageView *background;
    CGPoint sunCenter; //CoreGraphics Point
    CGFloat distanceEarthToSun;
    CGFloat distanceMoonToEarth;
    CGFloat angle;
    CGFloat angle1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBackground];
    [self addSunAndEarth];
    [self addMoon];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                             target:self
                                           selector:@selector(spinEarth)
                                           userInfo:nil
                                            repeats:true];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                             target:self
                                           selector:@selector(spinMoon)
                                           userInfo:nil
                                            repeats:true];
}
- (void)addSunAndEarth {
    sun = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun.png"]];
    earth = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth.png"]];
    CGSize mainViewSize = self.view.bounds.size;
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    sunCenter = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height + statusNavigationBarHeight) * 0.5);
    
    distanceEarthToSun = mainViewSize.width * 0.5 - 60;
    sun.center = sunCenter;
    angle = 0.0;
    earth.center = [self computePositionOfEarch:angle];
    
    [self.view addSubview:sun];
    [self.view addSubview:earth];
    
}
-(void) addBackground {
    background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background.jpg"]];
    background.frame = self.view.bounds;
    [self.view addSubview:background];
}
-(void) addMoon {
    moon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"moon1"]];
    distanceMoonToEarth = 50;
    angle1 = 0.0;
    moon.center = [self computePositionOfMoon:angle1];
    [self.view addSubview:moon];
}
- (CGPoint)computePositionOfMoon : (CGFloat) _angle {
    return CGPointMake(sunCenter.x + distanceEarthToSun * cos(angle) + distanceMoonToEarth*cos(angle1),
                       sunCenter.y + distanceEarthToSun * sin(angle) + distanceMoonToEarth*sin(angle1));
}

- (CGPoint)computePositionOfEarch: (CGFloat) _angle {
    return CGPointMake(sunCenter.x + distanceEarthToSun * cos(angle),
                       sunCenter.y + distanceEarthToSun * sin(angle));
}
- (void) spinEarth {
    angle += 0.009;
    earth.center = [self computePositionOfEarch:angle];
}
-(void) spinMoon{
    angle1 +=0.02;
    moon.center = [self computePositionOfMoon:angle1];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}
@end