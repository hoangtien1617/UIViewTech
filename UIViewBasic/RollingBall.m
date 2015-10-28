//
//  RollingBall.m
//  UIViewBasic
//
//  Created by Hoàng Tiến on 10/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "RollingBall.h"

@interface RollingBall ()

@end

@implementation RollingBall
{
    UIImageView *ball;
    NSTimer *time;
    CGFloat angle;
    CGFloat ballRadius;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawStadium];
    [self drawBall];

    angle =0.0;
    
    time = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(rollingBall1) userInfo:nil repeats:true];
    
    // Do any additional setup after loading the view.
}


-(void)drawStadium {
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"stadium.jpg"]];
    background.frame = self.view.bounds;
    [self.view addSubview:background];

}
-(void)drawBall {
    ballRadius = 40;
    ball = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"soccer.png"]];
    ball.frame = CGRectMake(0, 430, 80, 80);
    [self.view addSubview:ball];
    
    
}
-(void) rollingBall1 {
    CGFloat deltaAngle = 0.1;
    angle += deltaAngle;
    ball.transform = CGAffineTransformMakeRotation(angle);
    ball.center = CGPointMake(ball.center.x + ballRadius*deltaAngle, ball.center.y);
    if (ball.center.x > self.view.bounds.size.width - ballRadius) {
        [time invalidate];
        time = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self
                                               selector:@selector(rollingBall2) userInfo:nil repeats:YES];
    }
    
}
-(void)rollingBall2{
    CGFloat deltaAngle = 0.1;
    angle += deltaAngle;
    ball.transform = CGAffineTransformMakeRotation(-angle);
    ball.center = CGPointMake(ball.center.x - ballRadius*deltaAngle, ball.center.y);
    if (ball.center.x < ballRadius) {
        [time invalidate];
        time = [NSTimer scheduledTimerWithTimeInterval:0.05
                                                 target:self
                                               selector:@selector(rollingBall1)
                                               userInfo:nil repeats:YES];
    }
}
@end
