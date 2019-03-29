//
//  LCTCustomView.m
//  UIKitHomework
//
//  Created by Maksim Ivanov on 23/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "AMXCustomView.h"


@implementation AMXCustomView


double offsetX;
double offsetY;

#pragma mark - UIView Touches Handling

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = touches.anyObject;
    CGPoint  point = [touch locationInView:self];
    NSLog(@"Касание %.0f %.0f", point.x, point.y);
    
    offsetX = (self.frame.size.width / 2.0) - point.x;
    offsetY = (self.frame.size.height / 2.0) - point.y;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    NSLog(@"Перетаскивание %.0f %.0f", point.x, point.y);
    
    point.x = point.x + self.frame.origin.x + offsetX;
    point.y = point.y + self.frame.origin.y + offsetY;
    
    self.center = point;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = touches.anyObject;
    CGPoint  point = [touch locationInView:self];
    NSLog(@"Конец %.0f %.0f", point.x, point.y);
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Касание отменено");
}


@end

