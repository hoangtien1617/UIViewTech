//
//  ColorView.h
//  UIViewBasic
//
//  Created by Hoàng Tiến on 10/26/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorView : UIView
- (instancetype) initWithHex: (NSString*) hex
                       alpha: (CGFloat) alpha
                       frame: (CGRect) rect;
- (void) fadeOut;
@property (nonatomic,strong) NSString* hex; //getter and setter
@end
