//
//  ViewController.m
//  SGSelectViewController
//
//  Created by Maco_Tasu on 12/11/18.
//  Copyright (c) 2012年 MacoTasu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
-(void)loadMenu;
-(void)btn;
-(void)tap:(id)sender;
@end


@implementation ViewController {
    __strong SGSelectViewController *_sg;
    IBOutlet UILabel *_iconLbl;
}


#pragma view cycle

- (void)viewDidLoad
{
    //-------------------------
    // initialize
    //-------------------------
    _sg = [[SGSelectViewController alloc]init];
    
    [self loadMenu];
    [self btn];
    
    
    AppDelegate *appDelegate;
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.selectBtn = self.selectBtn;
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


//-----------------------------
// This Method load Icon-View
//-----------------------------
-(void)loadMenu{
    
    [self.view addSubview:_sg.view];
}


//-----------------------------
// Call Show Menu ＆ Set Icon
//-----------------------------
-(void)tap:(id)sender{
    
    [_sg sgViewAppear];
}


//-----------------------------
// UIButton
//-----------------------------
-(void)btn{
    
    _selectBtn = [UIButton  buttonWithType:UIButtonTypeCustom];
    [_selectBtn setFrame:CGRectMake(20, 20, 44, 44)];
    [_selectBtn setBackgroundImage:[UIImage imageNamed:@"choseBtn.png"] forState:UIControlStateNormal];
    [_selectBtn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_selectBtn];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
