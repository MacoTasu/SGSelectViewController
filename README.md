SGSelectViewController
======================

This can display a selection menu easily. Moreover, this library corresponds to ARC and development target is checking-of-operations ending in 5.1 and 6.0.


Installation
============

1.Please take out SGSelectViewController.h and .m from Four users and put in your XcodeProject.  
2.Please describe SGSelectViewController.h to prefix.pch of your Xcode Project.  
3.Please also add QuartzCore.framework to your Xcode Project.  
4.Please add an `images` folder to your XcodeProject.   
5.Finished installation.  

Usage
=====

@implementation <classname>{} of .m file of your project describes the next code.  
`__strong SGSelectViewController * _sg;`

Next, addSubview.  
`_sg = [[SGSelectViewController alloc]init];  [self.view addSubview:_sg.view];`

Since preparation was completed now, the following method is only called.   
`-(void)sgViewAppear;`  
The example of a source code.  
`[_sg sgViewAppear];`


menu is displayed now.
When you want to change the icon of a menu, it is necessary to add the created icon into your project and to change the picture name in arrangement called _ar in `-(void) setImage` of SGSelectViewController.m.
A maximum of 20 icons can be displayed. 

Please adjust the position of a menu by `#define VIEW_ORIGIN_X` and `#define VIEW_ORIGIN_Y` in SGSelectViewController.m. 

Since there is sample project, please check a motion. 


License
======
This is MIT LICENSE. 
Please read a LICENSE file for details.


Screen Shot
===========
![](images/ss.png)