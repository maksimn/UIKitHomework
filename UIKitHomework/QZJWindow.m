//
//  QZJWindow.m
//  UIKitHomework
//
//  Created by Maksim Ivanov on 23/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "QZJWindow.h"

@implementation QZJWindow

- (instancetype) init
{
    if (self = [super init])
    {
        self.backgroundColor = [UIColor greenColor];
        UIPanGestureRecognizer *recognizer = [UIPanGestureRecognizer new];
        [recognizer addTarget:self action:@selector(hanglePanGesture:)];
        [self addGestureRecognizer:recognizer];
    }
    return self;
}

// Сделать изменение цветовой окраски экрана при движении пальце слева направо от черного до белого цвета. (.backgroundColor = [UIColor colorWithRed:[0-1] green:[0-1] blue:[0-1])

- (void) hanglePanGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint gesturePoint = [gestureRecognizer locationInView: self];
    
    NSLog(@"Point = %f , %f", gesturePoint.x, gesturePoint.y);
    double width = self.frame.size.width;
    double value = gesturePoint.x / width;
    self.backgroundColor = [UIColor colorWithRed:value green:value blue:value alpha:1.0];
//    NSLog(@"gestureRecognizer.cancelsTouchesInView = %d", gestureRecognizer.cancelsTouchesInView);
//    NSLog(@"gestureRecognizer.delaysTouchesBegan = %d", gestureRecognizer.delaysTouchesBegan);
//    NSLog(@"gestureRecognizer.delaysTouchesEnded = %d", gestureRecognizer.delaysTouchesEnded);
//    NSLog(@"Свайп свайп свайп");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
