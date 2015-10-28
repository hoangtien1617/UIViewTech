//
//  ColorView.m
//  UIViewBasic
//
//  Created by Hoàng Tiến on 10/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "ColorView.h"
#import "UIColor+Extent.h"

@implementation ColorView
{
    UILabel *label;
}

-(instancetype) initWithHex: (NSString*) hex
                      alpha:(CGFloat)alpha
                      frame: (CGRect) rect {
    self = [super initWithFrame:rect];
    self.backgroundColor  = [[UIColor alloc]initWithHex:hex alpha:alpha];
    if (rect.size.width >150 && rect.size.height >30) {
        label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, rect.size.width - 10, 30)];
        label.center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
        label.textAlignment = NSTextAlignmentCenter ;
        label.text = hex;
        [self addSubview:label];
    }
    return self;
}
-(void) setHex: (NSString*)hex{
    self.backgroundColor= [[UIColor alloc]initWithHex:hex alpha:1.0];
    label.text = hex;
    label.textColor = [UIColor blackColor];
}
-(void) fadeOut {
    self.backgroundColor =[[UIColor alloc]initWithHex:self.hex
                                                alpha:0.1];
    label.textColor = [[UIColor alloc]initWithHex:@"000000"
                                            alpha:0.1];
}

@end
