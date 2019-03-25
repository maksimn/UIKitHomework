//
//  AMXWindow.m
//  UIKitHomework
//
//  Created by Maksim Ivanov on 25/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXWindow.h"

@implementation AMXWindow

- (instancetype) init
{
    if (self = [super init])
    {
        self.backgroundColor = [self getInitialWindowColor];
    }
    return self;
}

BOOL isStartedAtLeftBorder = NO;
double previousX;

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    double screenWidth = self.frame.size.width;
    double x0MaxValue = screenWidth / 7;
    
    if (point.x < x0MaxValue)
    {
        isStartedAtLeftBorder = YES;
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    double screenWidth = self.frame.size.width;
    
    if (isStartedAtLeftBorder && point.x >= previousX)
    {
        double colorValue = point.x / screenWidth;
        self.backgroundColor = [UIColor colorWithRed:colorValue green:colorValue blue:colorValue alpha:1.0];
    }
    
    previousX = point.x;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    isStartedAtLeftBorder = NO;
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [self getInitialWindowColor];
}

-(UIColor *) getInitialWindowColor
{
    return [UIColor greenColor];
}

@end
