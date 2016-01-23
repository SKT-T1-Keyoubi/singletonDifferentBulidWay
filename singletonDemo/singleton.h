//
//  singleton.h
//  singletonDemo
//
//  Created by LoveQiuYi on 16/1/23.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//  实现单例设计模式

// 单例头文件
//定义一个宏，实现.h文件的接口调用   ->##注意这个的用法
#define Singleton(methodName) +(instancetype) shared##methodName;

//定义一个宏，实现.m文件的接口调用，注意\表示下面一行的代码也是属于这个宏的,传入两个参数
#if __has_feature(objc_arc)//如果是arc的情况下

#define SingletonM(methodName)\
static id  _instance = nil; \
+(id)allocWithZone:(struct _NSZone *)zone{\
if (_instance == nil) {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
}\
return _instance;\
}\
-(id)init{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super init];\
});\
return _instance;\
}\
+(instancetype) shared##methodName{\
return [[self alloc]init];\
}

#else

#define SingletonM(methodName)\
static id _instance = nil; \
+(instancetype)allocWithZone:(struct _NSZone *)zone{\
if (_instance == nil) {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
}\
return _instance;\
}\
-(instancetype)init{\
if (_instance == nil) {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super init];\
});\
}\
return _instance;\
}\
+(instancetype) shared##methodName{\
return [[self alloc]init];\
}\
-(oneway void)release{\
}\
-(instancetype)retain{\
return self;\
}\
-(NSUInteger)retainCount{\
return 1;\
}

#endif
