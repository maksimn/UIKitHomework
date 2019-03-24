//
//  AppDelegate.m
//  UIKitHomework
//
//  Created by Maksim Ivanov on 22/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//
#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [UIWindow new];
    // Задание ViewController'a:
    MainViewController *mainViewController = [MainViewController new];
    self.window.rootViewController = mainViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
