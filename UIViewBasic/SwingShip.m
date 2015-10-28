//
//  SwingShip.m
//  UIViewBasic
//
//  Created by Hoàng Tiến on 10/20/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "SwingShip.h"
#import <AVFoundation/AVFoundation.h>


@interface SwingShip ()


@end

@implementation SwingShip
{
    UIImageView *ship;
    UIImageView *sea1;
    UIImageView *sea2;
    AVAudioPlayer *audio;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawShipAndSea];
    [self shipMove];
    [self seaMove];
    [self playSound];

}

-(void) drawShipAndSea {
    sea1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sea2.png"]];
    sea1.frame = self.view.bounds   ;
    [self.view addSubview:sea1];
    
    sea2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sea1.png"]];
    sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea2];
    
    ship = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Ship.png"]];
    ship.center = CGPointMake(200, 300);
    [self.view addSubview:ship];
}

-(void) shipMove {
    [UIView animateWithDuration:2 animations:^{
        ship.transform = CGAffineTransformMakeRotation(-0.08);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            ship.transform = CGAffineTransformMakeRotation(0.08);
        } completion:^(BOOL finished) {
            [self shipMove];
        }];
    }];
}

-(void) seaMove {
    [UIView animateWithDuration:10 animations:^{
        sea1.frame = CGRectMake(-self.view.bounds.size.width, 0 , self.view.bounds.size.width, self.view.bounds.size.height);
        sea2.frame = self.view.bounds;
    } completion:^(BOOL finished) {
        sea1.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [UIView animateWithDuration:10 animations:^{
            sea1.frame = self.view.bounds;
            sea2.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        } completion:^(BOOL finished) {
            sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            [self seaMove];
        }];
    }];
}

-(void) playSound{
    NSString *filePath  = [[NSBundle mainBundle] pathForResource:@"running" ofType:@"mp3"];
    NSURL *url = [ NSURL fileURLWithPath:filePath];
    NSError *error;
    audio = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    [audio prepareToPlay];
    [audio play];
    audio.numberOfLoops = -1;
     
}
-(void) viewWillDisappear:(BOOL)animated {
    [audio stop];
}

@end
