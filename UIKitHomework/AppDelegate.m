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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [UIWindow new];
    
    // Задание обработки жеста движения пальцем слева направо:
    self.window.backgroundColor = [UIColor greenColor];
    UIPanGestureRecognizer *recognizer = [UIPanGestureRecognizer new];
    [recognizer addTarget:self action:@selector(hanglePanGesture:)];
    [self.window addGestureRecognizer:recognizer];
    
    // Задание ViewController'a:
    MainViewController *mainViewController = [MainViewController new];
    self.window.rootViewController = mainViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void) hanglePanGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint gesturePoint = [gestureRecognizer locationInView: self.window];
    double width = self.window.frame.size.width;
    double value = gesturePoint.x / width;
    self.window.backgroundColor = [UIColor colorWithRed:value green:value blue:value alpha:1.0];
}

@end
