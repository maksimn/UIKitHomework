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


#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createMainView];
}

#pragma mark - Private

- (void)createMainView
{
    [self setupRefreshButton];
    [self prepareAMXCustomView];
    
    AMXWindow *amxWindow = (AMXWindow *) self.view.window;
    self.view.window.backgroundColor = amxWindow.initialColor;
}

- (void)setupRefreshButton
{
    self.refreshButton = [[UIButton alloc] initWithFrame:CGRectMake(50,30,120,40)];
    self.refreshButton.backgroundColor = [UIColor whiteColor];
    [self.refreshButton setTitle:@"Обновить" forState:UIControlStateNormal];
    [self.refreshButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.refreshButton addTarget:self action:@selector(refreshButtonPressHandler) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.refreshButton];
}

- (void)prepareAMXCustomView
{
    self.customView = [[AMXCustomView alloc] initWithFrame:CGRectMake(50, 100, 60, 70)];
    self.customView.backgroundColor = UIColor.redColor;
    [self.view addSubview:self.customView];
}

- (void)refreshButtonPressHandler
{
    [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self createMainView];
}


@end

