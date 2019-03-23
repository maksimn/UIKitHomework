//
//  LCTCustomView.m
//  UIKitHomework
//
//  Created by Maksim Ivanov on 23/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "LCTCustomView.h"

//====================== ВТОРАЯ ЧАСТЬ ЗАНЯТИЯ 1) СОБЫТИЯ КАCАНИЯ ЭКРАНА ======================

@implementation LCTCustomView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)even{
    UITouch * touch = touches.anyObject;
    CGPoint  point = [touch locationInView:self];
    NSLog(@"Касание %.0f %.0f", point.x, point.y);
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = touches.anyObject;
    CGPoint  point = [touch locationInView:self];
    NSLog(@"Перетаскивание %.0f %.0f", point.x, point.y);
    
    //====================== ВТОРАЯ ЧАСТЬ ЗАНЯТИЯ 2)ДВИГАЕМ ВЬЮХУ ЗА ТОЧКОЙ КАСАНИЯ ======================
    point.x =  point.x +  self.frame.origin.x;
    point.y =  point.y +  self.frame.origin.y;
    self.center = point;
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = touches.anyObject;
    CGPoint  point = [touch locationInView:self];
    NSLog(@"Конец %.0f %.0f", point.x, point.y);
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)even{
    NSLog(@"Касание отменено");
}

/*
 
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
