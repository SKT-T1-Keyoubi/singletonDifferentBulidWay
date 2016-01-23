//
//  SoundTool.m
//  singletonDemo
//
//  Created by LoveQiuYi on 16/1/23.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "SoundTool.h"

@implementation SoundTool
SingletonM(SoundTool);
////static定义一个全局变量
//static SoundTool * _soundTool = nil;
//+(instancetype)allocWithZone:(struct _NSZone *)zone{
//    //alloc创建对象调用的是底层的allocWithZone方法
//    if (_soundTool == nil) {
//        //GCD方法，代码只执行一次（线程安全）
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            _soundTool = [super allocWithZone:zone];
//        });
//    }
//    return _soundTool;
//}
////初始化内存
//-(instancetype)init{
//    if (_soundTool == nil) {
//        //GCD方法，代码只执行一次（线程安全）
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            _soundTool = [super init];
//        });
//    }
//    return _soundTool;
//}
//+(instancetype) sharedSoundTool{
//    
//    return [[self alloc]init];
//}
//-(oneway void)release{
//    //防止对象release后alloc不了新的对象->因为上面的对象的创建在单例模式中只会创建一个
//}
//
//-(instancetype)retain{
//    return self;
//}
//-(NSUInteger)retainCount{
//    return 1;//计数器永远为1
//}
@end
