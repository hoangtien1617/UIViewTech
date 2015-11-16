//
//  AmericaFootball.m
//  UIViewBasic
//
//  Created by Hoàng Tiến on 11/16/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "AmericaFootball.h"

@interface AmericaFootball ()

@end

@implementation AmericaFootball
{
    UIImageView* ball, *arrow, *background;
    UIRotationGestureRecognizer *rotateRecognizer;
    NSTimer* timer;
    CGFloat angel;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    background  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"casino1.jpg"]];
    background.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);

    arrow  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
    arrow.frame = CGRectMake(140, 160, 60,60);
    arrow.contentMode = UIViewContentModeScaleAspectFit;

    
    ball  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wheel3.png"]];
    ball.frame = CGRectMake(15, 200, 300, 300);
    ball.contentMode = UIViewContentModeScaleAspectFit;
    ball.userInteractionEnabled = YES;
    ball.multipleTouchEnabled = YES;
    [self.view addSubview:background];

    [self.view addSubview:ball];
    [self.view addSubview:arrow];

    rotateRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                    action:@selector(rotateMe:)];
    [ball addGestureRecognizer: rotateRecognizer];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.02
                                             target:self
                                           selector:@selector(loopBall)
                                           userInfo:nil
                                            repeats:true];
}
- (void) rotateMe: (UIRotationGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        ball.transform = CGAffineTransformRotate(gestureRecognizer.view.transform,
                                                 gestureRecognizer.rotation);
        angel= - gestureRecognizer.velocity;
    }
}
- (void) loopBall {
    ball.transform = CGAffineTransformMakeRotation(angel* M_PI / 2);
    angel =angel* 0.98;
}
@end

