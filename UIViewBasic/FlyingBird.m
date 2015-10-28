//
//  FlyingBird.m
//  UIViewBasic
//
//  Created by Hoàng Tiến on 10/20/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "FlyingBird.h"

@interface FlyingBird ()
{
    UIImageView *bird;
}

@end

@implementation FlyingBird

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawJungle];
    [self addBird];
    [self birdFly];
    
    
}

-(void) drawJungle {
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jungle.jpg"]]; //set image
    background.frame = self.view.bounds; //set full size
    //background.contentMode = UIViewContentModeScaleAspectFit ;
    [self.view addSubview:background];
    
}

-(void) addBird {
    bird = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 110, 80)];
    bird.animationImages  = @[[UIImage imageNamed:@"bird0.png"],
                              [UIImage imageNamed:@"bird1.png"],
                              [UIImage imageNamed:@"bird2.png"],
                              [UIImage imageNamed:@"bird3.png"],
                              [UIImage imageNamed:@"bird4.png"],
                              [UIImage imageNamed:@"bird5.png"]
                              ];
    bird.animationRepeatCount = -1 ; //loop 4ever
    bird.animationDuration = 0.5  ;
    [self.view addSubview:bird];
    [bird startAnimating];

    
    
}

-(void) birdFly {
    bird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:4 animations:^{
        bird.center = CGPointMake(self.view.bounds.size.width -100, self.view.bounds.size.height / 2);
    } completion:^(BOOL finished) {
        bird.transform = CGAffineTransformConcat(
                                                 CGAffineTransformMakeScale(-1, 1),
                                                 CGAffineTransformMakeRotation(M_PI_4));
        [UIView animateWithDuration:4 animations:^{
            bird.center = CGPointMake(40, 40);
        } completion:^(BOOL finished) {
            [self birdFly];
        }];
    }];
    
}

@end
