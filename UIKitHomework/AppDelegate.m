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

double previousX;

- (void) hanglePanGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    int state = gestureRecognizer.state;
    CGPoint gesturePoint = [gestureRecognizer locationInView: self.window];
    double screenWidth = self.window.frame.size.width;
    double colorValue;
    
    switch (state)
    {
        case UIGestureRecognizerStateBegan:
            break;
            
        case UIGestureRecognizerStateChanged:
            
            if (gesturePoint.x >= previousX)
            {
                colorValue = gesturePoint.x / screenWidth;
                self.window.backgroundColor = [UIColor colorWithRed:colorValue green:colorValue blue:colorValue alpha:1.0];
            }
            break;
        
        default:
            break;
    }
    
    previousX = gesturePoint.x;
}

@end
