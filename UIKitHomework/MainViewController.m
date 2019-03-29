//
//  ViewController.m
//  UIKitHomework
//
//  Created by Maksim Ivanov on 22/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "MainViewController.h"
#import "AMXCustomView.h"
#import "AMXWindow.h"

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
    
    AMXWindow *amxWindow = (AMXWindow *) self.view.window;
    self.view.window.backgroundColor = [amxWindow getInitialColor];
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
    [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self viewDidLoad];
}

@end

//...) попробуй без isStartedAtLeftBorder. Непонятно, зачем он нужен. Мы же можем водить пальцем в обе стороны
//
//2) Сделай getInitialColor свойством initialColor и дергай геттер
//
//3) Руками вызывать viewDidLoad - плохо, не надо так.
//
//Вынеси создание интерфейса пользовательского и дергай отдельнйы метод
//
//+ код стайл
