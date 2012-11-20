//
//  AppDelegate.h
//  SGSelectViewController
//
//  Created by Maco_Tasu on 12/11/18.
//  Copyright (c) 2012年 MacoTasu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (weak, nonatomic) UIButton *selectBtn;

@end
