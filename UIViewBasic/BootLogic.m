//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"Basic View", CLASS: @"BasicView"},
                                    @{TITLE: @"Chess", CLASS: @"ChessView"},
                                    @{TITLE: @"Campfire", CLASS: @"CampFire"},
                                    @{TITLE: @"Nested Squares", CLASS: @"NestedSquares"},
                                    @{TITLE: @"Flying Bird", CLASS: @"FlyingBird"},
                                    @{TITLE: @"Swing Ship", CLASS: @"SwingShip"},
                                    @{TITLE: @"Star Field", CLASS: @"StarField"},
                                    @{TITLE: @"Hex Color 2", CLASS: @"HexColor"},
                                    @{TITLE: @"Hex Color 3", CLASS: @"DemoColor"},
                                    @{TITLE: @"Rolling Ball", CLASS: @"RollingBall"}





                                    
                          ]};
    mainScreen.menu = @[basic];
    mainScreen.title = @"Bootstrap App";
    mainScreen.about = @"This is demo bootstrap demo app. It is collection of sample code of AVFoundation";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
