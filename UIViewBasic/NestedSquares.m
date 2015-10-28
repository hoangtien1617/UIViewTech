//
//  NestedSquares.m
//  UIViewBasic
//
//  Created by Hoàng Tiến on 10/19/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "NestedSquares.h"

@interface NestedSquares ()

@end

@implementation NestedSquares

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawNestedSquares];
    [self performSelector:@selector(rotateAllSquares)
               withObject:nil
               afterDelay:2];
    
    
    
}
-(void) drawNestedSquares{
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat margin = 20;
    CGFloat recWidth = mainViewSize.width - margin * 2.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    CGPoint center = CGPointMake(mainViewSize.width * 0.5,
                                 (mainViewSize.height + statusNavigationBarHeight) * 0.5);
    
    for (int i = 0; i < 10; i++) {
        UIView* square;
        if (i % 2 == 0) {
            square = [self drawSquaresByWidth: recWidth
                                   andRotate: false
                                    atCenter: center];
        } else  {
            square = [self drawSquaresByWidth: recWidth
                                   andRotate: true
                                    atCenter: center];
        }
        [self.view addSubview:square];
        
        recWidth = recWidth * 0.707;
    }

    
}
-(UIView*) drawSquaresByWidth : (CGFloat) width
                     andRotate: (BOOL) rotate
                      atCenter: (CGPoint) center

{
    UIView *square = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
    square.center = center;
    square.backgroundColor = rotate ? [UIColor whiteColor] : [UIColor darkGrayColor];
    square.transform = rotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    return square;
}
-(void) rotateAllSquares {
    [UIView animateWithDuration:2.0 animations:^{
        for (int i = 0; i < self.view.subviews.count; i++) {
            if (i % 2 == 0) {
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformIdentity;
            }else{
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformMakeRotation(M_PI_4);
            

            }
        }
    }];
    
}
@end
