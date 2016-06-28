//
//  AppDelegate.h
//  Shui
//
//  Created by HeBin on 16/6/27.
//  Copyright © 2016年 Myzle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// Init a new viewcontroller
@property (strong, nonatomic) MainViewController *mainViewController;

@end

