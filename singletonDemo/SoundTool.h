//
//  SoundTool.h
//  singletonDemo
//
//  Created by LoveQiuYi on 16/1/23.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "singleton.h"
@interface SoundTool : NSObject
//+(instancetype) sharedSoundTool;
Singleton(SoundTool);
@end
