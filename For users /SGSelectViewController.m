//
//  SGSelectViewController.m
//  SGSelectViewController
//
//  Created by Maco_Tasu on 12/11/18.
//  Copyright (c) 2012年 MacoTasu. All rights reserved.
//

#import "SGSelectViewController.h"

@interface SGSelectViewController ()
- (id)init;
- (void)setImage;
- (void)loadImage;
- (void)viewDetail;
-(void)changeIcon:(id)sender;
-(void)highlightButton:(UIButton *)btn;
-(void)sgViewDissAppear;
-(void)endAnimation;
-(void)didEnd;
@end

#define VIEW_ORIGIN_X 10
#define VIEW_ORIGIN_Y 70
#define BUTTOM_MARGIN 20
#define TOP_MARGIN 21


//-------------------------
// You should change the following five sizes
//    if you want to change the number of a party's icons or icons sizes.
//-------------------------
#define BTN_W_H 48
#define ONE_ROW_ICON 5
#define MARGIN_X 10
#define MARGIN_Y 10


//-------------------------
// The number of buttons needs to be the same as the number of [NSDictionary count].
// Under the present circumstances, it is OK to 20 pieces.
//-------------------------
#define BUTTON_COUNT 20



@implementation SGSelectViewController{
    __strong NSArray *_ar;
    NSInteger _iconNumber;
    NSMutableArray *_iconArray;
    UIButton *_btn[BUTTON_COUNT];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //-------------------------
        // initialize 
        //-------------------------
        [self setView:[[UIView alloc] init]];
        _iconArray = [[NSMutableArray alloc]init];
        _iconNumber = -1;
        
    }
    return self;
}

-(id)init{
    
    self = [super init];
    
    if (self) {
        
        [self setImage];
        [self loadImage];
        [self viewDetail];
        
    }
    
    return self;
}


#pragma Icon

//-------------------------
// Set-Icon
//-------------------------
-(void)setImage{
    
   _ar = [NSArray arrayWithObjects:
          @"plan_rest.png",
          @"plan_train.png",
          @"plan_structure.png",
          @"plan_nature.png",
          @"plan_walk.png",
          @"plan_shopping.png",
          @"plan_eat.png",
          @"plan_plane.png",
          @"plan_sports.png",nil];

}


#pragma self.view

//-------------------------
// self.view setting
//-------------------------
-(void)viewDetail{
    
    //x is Row count
    int x = 0;
    
    if([_iconArray count] % ONE_ROW_ICON != 0)
        x = [_iconArray count]/ONE_ROW_ICON + 1;
    else
        x = [_iconArray count]/ONE_ROW_ICON ;

    [self.view setAlpha:0.0];
    [self.view setFrame:CGRectMake(VIEW_ORIGIN_X, VIEW_ORIGIN_Y, (MARGIN_X+BTN_W_H)*ONE_ROW_ICON+MARGIN_X, BUTTOM_MARGIN + (BTN_W_H+MARGIN_Y)*x)];
    [self.view setClipsToBounds:true];
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIImage *backgroundImage = [UIImage imageNamed:@"balloon.png"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:backgroundImage]];
    self.view.layer.cornerRadius = 5;
}




#pragma Menu Button

//-------------------------
// Icon load&set
//-------------------------
-(void)loadImage{
    
    _iconArray = [_ar mutableCopy];
    
    int index = 0;
    int row = 0;
    int count = 0;
    for (NSString *tmpStr in _iconArray){
        
        if(count<BUTTON_COUNT){
            _btn[count] = [UIButton buttonWithType:UIButtonTypeCustom];
            [_btn[count] setFrame:CGRectMake((index+1)*MARGIN_X+index*BTN_W_H,TOP_MARGIN+(MARGIN_Y+BTN_W_H)*row, BTN_W_H, BTN_W_H)];
            [_btn[count] setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[_iconArray objectAtIndex:count]]] forState:UIControlStateNormal];
            [_btn[count] addTarget:self action:@selector(changeIcon:) forControlEvents:UIControlEventTouchUpInside];
            [_btn[count] setTag:count];
            [self.view addSubview:_btn[count]];
        
            index++;
            count++;
        
            if(index%ONE_ROW_ICON == 0){
                row++;
            index = 0;
            }
        }
        
    }
    
}


//-------------------------
// Icon change action
//-------------------------
-(void)changeIcon:(id)sender{
    [self performSelector:@selector(highlightButton:) withObject:sender afterDelay:0.0];
}


//-------------------------
// HighLight Button
//-------------------------
-(void)highlightButton:(UIButton *)btn{
    
    for(int i = 0; i < BUTTON_COUNT; i++){
        
        int x = _btn[i].tag;
        
        if(btn.tag == x){
            _btn[x].highlighted = NO;
            _iconNumber = x;
        }
        else{
            _btn[i].highlighted = YES;
        }
    }
    
    [self performSelector:@selector(didEnd) withObject:nil afterDelay:0.1];
}


#pragma OK Button&Animation

//---------------------------
// DisAppear sgView animation
//---------------------------
-(void)sgViewDissAppear{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    
    [self.view setAlpha:0.0];
    
    [UIView commitAnimations];
}

//-------------------------
// Appear sgView animation
//-------------------------
-(void)sgViewAppear{

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:nil];
    
    [self.view setAlpha:1.0];
    
    [UIView commitAnimations];
}

//-------------------------
// Tap OK Button Action
//-------------------------
-(void)didEnd{


    [self sgViewDissAppear];
    
}


//-------------------------
// After end animaiton
//-------------------------
-(void)endAnimation{

    //The processing after view disappears here is described.
    
    
    /*NSDictionary *tmpDic;
    if (_iconNumber == -1) {
        //No Select
        tmpDic = [NSDictionary dictionaryWithObject:@"choseBtn.png" forKey:@"icon"];
    }else{
        //Did Select
        tmpDic = [NSDictionary dictionaryWithObject:[_iconArray objectAtIndex:_iconNumber] forKey:@"icon"];
    }*/
    

}


#pragma view cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
