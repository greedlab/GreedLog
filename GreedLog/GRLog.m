//
//  GRLog.m
//  GRLog
//
//  Created by Bell on 15/5/13.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import "GRLog.h"

static GRLogLevel __GRLogLevel = GRLogLevelDebug;
static GRLogStyle __GRLogStyle = GRLogStyleFprintf;
static FILE *fp = NULL;

@implementation GRLog

+ (void)setGRLogLevel:(GRLogLevel)logLevel
{
    __GRLogLevel = logLevel;
}

+ (void)setGRLogStyle:(GRLogStyle)logStyle
{
    __GRLogStyle = logStyle;
}

+ (void)logWithFileName:(NSString*)fileName lineNumber:(NSUInteger)lineNumber method:(NSString*)method logLevel:(GRLogLevel)logLevel format:(NSString *)format, ...
{
    NSString *levelStr = nil;
    if (__GRLogLevel >= logLevel) {
        switch (logLevel) {
            case GRLogLevelNone:
                levelStr = nil;
                break;
            case GRLogLevelEmergency:
                levelStr = [NSString stringWithFormat:@"<%@>",[NSString stringWithUTF8String:ASL_STRING_EMERG]];
                break;
            case GRLogLevelAlert:
                levelStr = [NSString stringWithFormat:@"<%@>",[NSString stringWithUTF8String:ASL_STRING_ALERT]];
                break;
            case GRLogLevelCritical:
                levelStr = [NSString stringWithFormat:@"<%@>",[NSString stringWithUTF8String:ASL_STRING_CRIT]];
                break;
            case GRLogLevelError:
                levelStr = [NSString stringWithFormat:@"<%@>",[NSString stringWithUTF8String:ASL_STRING_ERR]];
                break;
            case GRLogLevelWarning:
                levelStr = [NSString stringWithFormat:@"<%@>",[NSString stringWithUTF8String:ASL_STRING_WARNING]];
                break;
            case GRLogLevelNotice:
                levelStr = [NSString stringWithFormat:@"<%@>",[NSString stringWithUTF8String:ASL_STRING_NOTICE]];
                break;
            case GRLogLevelInfo:
                levelStr = [NSString stringWithFormat:@"<%@>",[NSString stringWithUTF8String:ASL_STRING_INFO]];
                break;
            case GRLogLevelDebug:
                levelStr = [NSString stringWithFormat:@"<%@>",[NSString stringWithUTF8String:ASL_STRING_DEBUG]];
                break;
            default:
                levelStr = @"";
                break;
        }
    }
    if (!levelStr) {
        return;
    }
    /*! Hold info on variable arguments */
    va_list ap;
    
    /*! Init a list with variable arguments */
    va_start (ap, format);
    
    /*! Get the body */
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    
    /*! End using list */
    va_end (ap);
    
    /*! Create the string to print */
    NSString *realfileName = [fileName lastPathComponent];
    
    if (__GRLogStyle == GRLogStyleFprintf) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *dateStr = [dateFormatter stringFromDate:[NSDate date]];
        if (fp) {
            fprintf(fp, "%s %s:%lu%s%s %s\n",[dateStr UTF8String], [realfileName UTF8String], (unsigned long)lineNumber, [method UTF8String], [levelStr UTF8String], [body UTF8String]);
            fflush(fp);
        } else {
            fprintf(stderr, "%s %s:%lu%s%s %s\n",[dateStr UTF8String], [realfileName UTF8String], (unsigned long)lineNumber, [method UTF8String], [levelStr UTF8String], [body UTF8String]);
        }
    } else {
        NSLog(@"%s:%lu%s%@ %s\n",[realfileName UTF8String], (unsigned long)lineNumber, [method UTF8String], levelStr, [body UTF8String]);
    }
}

+ (void)EnabelLogFile:(BOOL)enable
{
    if (__GRLogStyle == GRLogStyleNSLog) {
        if (enable) {
            NSString *logFilePath = [[self class] logFilePath];
            if (!fp) {
                fp = fopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+");
            }
        } else {
            if (fp) {
                fclose(fp);
                fp = NULL;
            }
        }
    } else {
        if (enable) {
            NSString *logFilePath = [[self class] logFilePath];
            freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
        } else {
            // can not open console
        }
    }
}

+ (NSString*)logFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *logFilePath = [documentsDirectory stringByAppendingPathComponent:@"console.log"];
    
    GRLogInfo(@"logFilePath:%@",logFilePath);
    
    return logFilePath;
}

@end
