//
//  AMXWindow.m
//  UIKitHomework
//
//  Created by Maksim Ivanov on 25/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "AMXWindow.h"


@interface AMXWindow ()


@property (nonatomic, assign) double previousX;


@end


@implementation AMXWindow


- (instancetype) init
{
    if (self = [super init])
    {
        self.initialColor = UIColor.greenColor;
        self.backgroundColor = self.initialColor;
    }
    return self;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    double screenWidth = self.frame.size.width;
    
    if (point.x >= self.previousX)
    {
        double colorValue = point.x / screenWidth;
        self.backgroundColor = [UIColor colorWithRed:colorValue green:colorValue blue:colorValue alpha:1.0];
    }
    
    self.previousX = point.x;
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = self.initialColor;
}


@end
