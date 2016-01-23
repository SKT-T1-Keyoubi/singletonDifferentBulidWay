//
//  ViewController.m
//  singletonDemo
//
//  Created by LoveQiuYi on 16/1/23.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "ViewController.h"
#import "SoundTool.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  viewController.m是在非ARC环境下编译的，所有内存全部没有自动释放
     */
    //非ARC条件下创建单例模式的对象
    SoundTool * tool1 = [SoundTool sharedSoundTool];//创建的一个单例对象->这个对象是不会被释放的，不会有内存泄露
    NSLog(@"%lu",(unsigned long)[tool1 retainCount]);
    SoundTool * tool2 = [[SoundTool alloc]init];//两种方式创建的对象是同一个
    NSLog(@"%lu",(unsigned long)[tool2 retainCount]);
    NSLog(@"%p,%p",tool1,tool2);
    //ARC条件下创建的单例模式对象->运行在非ARC环境下
    Person *p1 = [Person sharedPerson];
    NSLog(@"%lu",(unsigned long)[p1 retainCount]);
    Person *p2 = [[Person alloc]init];
    NSLog(@"%lu",(unsigned long)[p2 retainCount]);
    NSLog(@"%p,%p",p1,p2);
#if !__has_feature(objc_arc)//为非ARC的情况下，进行release操作释放内存
    [tool2 release];
    [p2 release];
#endif
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
