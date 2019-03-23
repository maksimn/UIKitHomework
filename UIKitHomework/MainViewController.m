//
//  ViewController.m
//  UIKitHomework
//
//  Created by Maksim Ivanov on 22/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "MainViewController.h"
#import "LCTCustomView.h"

@interface MainViewController ()

@property (nonatomic, strong) UIButton *refreshButton;
@property (nonatomic, strong) LCTCustomView* customView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
    
    [self setupRefreshButton];
    
    //подготовка интерфейса ВТОРАЯ ЧАСТЬ ЗАНЯТИЯ
    [self prepareUi_NEW];
}

- (void) setupRefreshButton
{
    self.refreshButton = [[UIButton alloc] initWithFrame:CGRectMake(50,30,120,40)];
    
    [self.refreshButton setTitle:@"Обновить" forState:UIControlStateNormal];
    [self.refreshButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.refreshButton.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.refreshButton];
}

//подготовка интерфейса
- (void) prepareUi_NEW
{
    //создали предствавление
    self.customView = [[LCTCustomView alloc] initWithFrame:CGRectMake(50, 100, 60, 70)];
    self.customView.backgroundColor = UIColor.redColor;
    //добавили его на экран
    [self.view addSubview:self.customView];
}

@end
