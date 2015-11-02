//
//  DropBall.m
//  UIViewBasic
//
//  Created by Hoàng Tiến on 11/2/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "DropBall.h"

@interface DropBall ()
{
    UIImageView *ball;
    NSTimer *timer;
    CGFloat ballRadius;
    CGFloat x,y, vanTocY, giaTocY, maxHeight;
}
@end

@implementation DropBall

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawStadium];
    [self drawBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.016
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
}
-(void)drawStadium {
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"stadium.jpg"]];
    background.frame = self.view.bounds;
    [self.view addSubview:background];
    
}
-(void)drawBall {
    CGSize mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"soccer"]];
    ballRadius = 32.0;
    x = mainViewSize.width *0.5;
    y = ballRadius;
    vanTocY = 0.0;
    giaTocY = 0.4;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    maxHeight = mainViewSize.height - ballRadius - statusNavigationBarHeight;
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
}
-(void)dropBall {
    vanTocY = vanTocY + giaTocY;
    y = y + vanTocY;
    if (y>maxHeight) {
        vanTocY = - vanTocY * 0.85;
        y = maxHeight;
    }
    ball.center = CGPointMake(x, y);
}
    
@end
