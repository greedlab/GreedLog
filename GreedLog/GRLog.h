//
//  GRLog.h
//  GRLog
//
//  Created by Bell on 15/5/13.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <asl.h>

typedef NS_ENUM(NSInteger, GRLogLevel) {
    GRLogLevelNone = -2, // 都不显示
    GRLogLevelDefault = -1, // 只显示GRLog
    GRLogLevelEmergency = ASL_LEVEL_EMERG,
    GRLogLevelAlert = ASL_LEVEL_ALERT,
    GRLogLevelCritical = ASL_LEVEL_CRIT,
    GRLogLevelError = ASL_LEVEL_ERR,
    GRLogLevelWarning = ASL_LEVEL_WARNING,
    GRLogLevelNotice = ASL_LEVEL_NOTICE,
    GRLogLevelInfo = ASL_LEVEL_INFO,
    GRLogLevelDebug = ASL_LEVEL_DEBUG
};

typedef NS_ENUM(NSUInteger, GRLogStyle) {
    GRLogStyleNSLog = 0, // NSLog方式打印
    GRLogStyleFprintf = 1, // fprintf方式打印
};

//#ifdef NSLog
//#undef NSLog
//#define NSLog(args...) GRLog(args...)
//#endif

#ifndef GRLog
#define GRLog(args...) [GRLog logWithFileName:[NSString stringWithUTF8String:__FILE__] lineNumber:__LINE__ method:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] logLevel:GRLogLevelDefault format:args]
#else
#define GRLog(x...)
#endif

#ifndef GRLogEmergency
#define GRLogEmergency(args...) [GRLog logWithFileName:[NSString stringWithUTF8String:__FILE__] lineNumber:__LINE__ method:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] logLevel:GRLogLevelEmergency format:args]
#else
#define GRLogEmergency(x...)
#endif // GRLogEmergency

#ifndef GRLogAlert
#define GRLogAlert(args...) [GRLog logWithFileName:[NSString stringWithUTF8String:__FILE__] lineNumber:__LINE__ method:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] logLevel:GRLogLevelAlert format:args]
#else
#define GRLogAlert(x...)
#endif // GRLogAlert

#ifndef GRLogCritical
#define GRLogCritical(args...) [GRLog logWithFileName:[NSString stringWithUTF8String:__FILE__] lineNumber:__LINE__ method:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] logLevel:GRLogLevelCritical format:args]
#else
#define GRLogCritical(x...)
#endif // GRLogCritical

#ifndef GRLogError
#define GRLogError(args...) [GRLog logWithFileName:[NSString stringWithUTF8String:__FILE__] lineNumber:__LINE__ method:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] logLevel:GRLogLevelError format:args]
#else
#define GRLogError(x...)
#endif // GRLogError

#ifndef GRLogWarning
#define GRLogWarning(args...) [GRLog logWithFileName:[NSString stringWithUTF8String:__FILE__] lineNumber:__LINE__ method:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] logLevel:GRLogLevelWarning format:args]
#else
#define GRLogWarning(x...)
#endif // GRLogWarning

#ifndef GRLogNotice
#define GRLogNotice(args...) [GRLog logWithFileName:[NSString stringWithUTF8String:__FILE__] lineNumber:__LINE__ method:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] logLevel:GRLogLevelNotice format:args]
#else
#define GRLogNotice(x...)
#endif // GRLogNotice

#ifndef GRLogInfo
#define GRLogInfo(args...) [GRLog logWithFileName:[NSString stringWithUTF8String:__FILE__] lineNumber:__LINE__ method:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] logLevel:GRLogLevelInfo format:args]
#else
#define GRLogInfo(x...)
#endif // GRLogInfo

#ifndef GRLogDebug
#define GRLogDebug(args...) [GRLog logWithFileName:[NSString stringWithUTF8String:__FILE__] lineNumber:__LINE__ method:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] logLevel:GRLogLevelDebug format:args]
#else
#define GRLogDebug(x...)
#endif // GRLogDebug

@interface GRLog : NSObject

/**
 *  设置日志等级
 *
 *  @param logLevel 日志等级
 */
+ (void)setGRLogLevel:(GRLogLevel)logLevel;

/**
 *  设置日志风格
 *
 *  @param logStyle 日志风格
 */
+ (void)setGRLogStyle:(GRLogStyle)logStyle;

/**
 *  打印日志
 *
 *  @param fileName   文件名
 *  @param lineNumber 行数
 *  @param method     方法
 *  @param logLevel   日志等级
 *  @param format     打印内容
 */
+ (void)logWithFileName:(NSString*)fileName lineNumber:(NSUInteger)lineNumber method:(NSString*)method logLevel:(GRLogLevel)logLevel format:(NSString *)format, ...;

/**
 *  将打印日志存储到文件
 *  GRLogStyleNSLog 时开启后不能关闭
 *
 *  @param enable 是否打开日志文件
 */
+ (void)EnabelLogFile:(BOOL)enable;

/**
 *  开启打印文件后，日志存储的文件路径
 *
 *  @return 日志存储的文件路径
 */
+ (NSString*)logFilePath;

@end
