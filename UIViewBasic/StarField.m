//
//  StarField.m
//  UIViewBasic
//
//  Created by Hoàng Tiến on 10/20/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "StarField.h"
@interface StarField ()

@end

@implementation StarField

{
    UIImageView *red,*violet,*brown,*green;
    CGPoint center;
    CGFloat deltaX;
    CGFloat deltaY;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    deltaX = 100;
    deltaY = 100;
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone ;
    CGSize size = self.view.bounds.size;
    center = CGPointMake(size.width * 0.5, (size.height-60)*0.5);
    red = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"red.png"]];
    violet = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"violet.png"]];
    brown = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"brown.png"]];
    green = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"green.png"]];

    [self viTri];
    [self.view addSubview:red];
    [self.view addSubview:violet];
    [self.view addSubview:brown];
    [self.view addSubview:green];
    [self Animate];

}

-(void) Animate {
    [UIView animateWithDuration:1 animations:^{
        brown.center = CGPointMake(center.x - 100, center.y - 100);
        red.center = CGPointMake(center.x + deltaX, center.y + deltaY);
        green.center = CGPointMake(center.x + deltaX, center.y - deltaY);
        violet.center = CGPointMake(center.x - deltaX, center.y + deltaY);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            brown.center = CGPointMake(center.x - deltaX, center.y);
            green.center = CGPointMake(center.x, center.y - deltaY);
            red.center = CGPointMake(center.x + deltaX, center.y);
            violet.center = CGPointMake(center.x, center.y + deltaY);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:3 animations:^{
                [self viTri];
            } completion:^(BOOL finished) {
                [self Animate];
            }];
        }];
         }];
    
}

-(void) viTri {
    red.center = center;
    violet.center = center;
    brown.center = center;
    green.center = center;
    
    
}


@end
