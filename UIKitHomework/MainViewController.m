//
//  ViewController.m
//  UIKitHomework
//
//  Created by Maksim Ivanov on 22/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "MainViewController.h"
#import "AMXCustomView.h"

@interface MainViewController ()

@property (nonatomic, strong) UIButton *refreshButton;
@property (nonatomic, strong) AMXCustomView* customView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    //подготовка интерфейса ВТОРАЯ ЧАСТЬ ЗАНЯТИЯ
    [self setupRefreshButton];
    [self prepareUi_NEW];
    self.view.backgroundColor = [UIColor greenColor];
    [self prepareGestureRecognizer];
}

- (void) setupRefreshButton
{
    self.refreshButton = [[UIButton alloc] initWithFrame:CGRectMake(50,30,120,40)];
    
    [self.refreshButton setTitle:@"Обновить" forState:UIControlStateNormal];
    [self.refreshButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.refreshButton.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.refreshButton];
    
    [self.refreshButton addTarget:self action:@selector(refreshButtonPressHandler) forControlEvents:UIControlEventTouchUpInside];
}

//подготовка интерфейса
- (void) prepareUi_NEW
{
    //создали предствавление
    self.customView = [[AMXCustomView alloc] initWithFrame:CGRectMake(50, 100, 60, 70)];
    self.customView.backgroundColor = UIColor.redColor;
    //добавили его на экран
    [self.view addSubview:self.customView];
}

- (void) refreshButtonPressHandler
{
    NSLog(@"refreshButtonPressHandler");
    self.refreshButton=nil;
    self.customView=nil;
    [self viewDidLoad];
}

- (void) prepareGestureRecognizer
{
    // Задание обработки жеста движения пальцем слева направо:
    UIPanGestureRecognizer *recognizer = [UIPanGestureRecognizer new];
    [recognizer addTarget:self action:@selector(hanglePanGesture:)];
    recognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:recognizer];
}

BOOL isStartedAtLeftBorder = NO;
double previousX;

- (void) hanglePanGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    int state = gestureRecognizer.state;
    CGPoint gesturePoint = [gestureRecognizer locationInView: self.view];
    double screenWidth = self.view.frame.size.width;
    double x0MaxValue = screenWidth / 7;
    double colorValue;
    
    switch (state)
    {
        case UIGestureRecognizerStateBegan:
            if (gesturePoint.x < x0MaxValue)
            {
                isStartedAtLeftBorder = YES;
            }
            break;
            
        case UIGestureRecognizerStateChanged:
            
            if (isStartedAtLeftBorder && gesturePoint.x >= previousX)
            {
                colorValue = gesturePoint.x / screenWidth;
                self.view.backgroundColor = [UIColor colorWithRed:colorValue green:colorValue blue:colorValue alpha:1.0];
            }
            break;
            
        case UIGestureRecognizerStateEnded:
            isStartedAtLeftBorder = NO;
            break;
            
        default:
            break;
    }
    
    previousX = gesturePoint.x;
}

@end
