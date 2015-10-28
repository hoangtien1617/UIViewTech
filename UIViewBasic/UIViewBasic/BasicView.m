//
//  BasicView.m
//  UIViewBasic
//
//  Created by Hoàng Tiến on 10/19/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "BasicView.h"

@interface BasicView ()

@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UISlider *rotateSlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;

@end

@implementation BasicView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)onShow:(UISwitch *)sender {
    self.myView.hidden = !sender.on;
}
- (IBAction)onAlphaChange:(UISlider *)sender {
    self.myView.alpha = sender.value;
}
- (IBAction)onRotateChange:(UISlider *)sender {
    [self rotateAndScale];
    
}
- (IBAction)onScaleChange:(UISlider *)sender {
    [self rotateAndScale];
}
- (IBAction)onColorChange:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.myView.backgroundColor = UIColor.blackColor;
            break;
        case 1:
            self.myView.backgroundColor = [UIColor redColor];
            break;
        case 2:
            self.myView.backgroundColor = [UIColor greenColor];
            break;
        case 3:
            self.myView.backgroundColor = [UIColor blueColor];
            break;
        default:
            break;
    }
}
-(void) rotateAndScale {
    CGAffineTransform rotateTranform = CGAffineTransformMakeRotation(self.rotateSlider.value * M_PI);
    CGAffineTransform scaleTranform = CGAffineTransformMakeScale(self.scaleSlider.value, self.scaleSlider.value);
    self.myView.transform = CGAffineTransformConcat(rotateTranform, scaleTranform);
    
}

@end
