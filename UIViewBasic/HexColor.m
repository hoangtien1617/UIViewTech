//
//  HexColor.m
//  UIViewBasic
//
//  Created by Hoàng Tiến on 10/22/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "HexColor.h"
#import "UIColor+Extent.h"

@implementation HexColor

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(60, 60, 120, 50) ];
    label.backgroundColor = [[UIColor alloc]initWithHex:@"D9E2CB" alpha:1];
    [self.view addSubview:label];
}

@end
