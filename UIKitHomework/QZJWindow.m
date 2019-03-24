//
//  QZJWindow.m
//  UIKitHomework
//
//  Created by Maksim Ivanov on 23/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "QZJWindow.h"

@implementation QZJWindow

// Сделать изменение цветовой окраски экрана при движении пальце слева направо от черного до белого цвета. (.backgroundColor = [UIColor colorWithRed:[0-1] green:[0-1] blue:[0-1])

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    double width = self.frame.size.width;
    double value = point.x / width;
    self.backgroundColor = [UIColor colorWithRed:value green:value blue:value alpha:1.0];
    // NSLog(@"Окно %.0f %.0f", point.x, point.y);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
