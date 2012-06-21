#import "NSDate+SocialAPI.h"
#import "ISO8601DateFormatter.h"

@implementation NSDate (SocialAPI)

+ (NSDate *)dateFromTwitterAPIDateString:(NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (formatter == nil) {
        [formatter setDateStyle:NSDateFormatterLongStyle];
        [formatter setTimeStyle:NSDateFormatterNoStyle];
        [formatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    }
    NSDate* date = [formatter dateFromString:string];
    [formatter release];
    return date;
}

+ (NSDate *)dateFromISO8601DateString:(NSString *)string
{
    ISO8601DateFormatter* formatter = [[ISO8601DateFormatter alloc] init];
    NSDate* date = [formatter dateFromString:string];
    [formatter release];
    return date;
}

- (NSString *)howLongAgoFromNow
{
    return [self howLongAgoFrom:[NSDate date]];
}

- (NSString *)howLongAgoFrom:(NSDate *)date
{
    NSInteger t = (NSInteger)[date timeIntervalSinceDate:self];
    if (t <= 0) {
        return @"now";
    } else if(t < 60) {
        if (t == 1) {
            return [NSString stringWithFormat:@"%d sec", t];
        } else {
            return [NSString stringWithFormat:@"%d secs", t];
        }
    } else if(t < 3600) {
        t = t / 60;
        if (t == 1) {
            return [NSString stringWithFormat:@"%d min", t];
        } else {
            return [NSString stringWithFormat:@"%d mins", t];
        }
    } else if(t < 86400) {
        t = t / 3600;
        if (t == 1) {
            return [NSString stringWithFormat:@"%d hour", t];
        } else {
            return [NSString stringWithFormat:@"%d hours", t];
        }
    } else if(t < 604800) {
        t = t / 86400;
        if (t == 1) {
            return [NSString stringWithFormat:@"%d day", t];
        } else {
            return [NSString stringWithFormat:@"%d days", t];
        }
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@""];
        [formatter setTimeZone:[NSTimeZone systemTimeZone]];
        [formatter setDateFormat:@"yyyy/MM/dd"];
        NSString *str = [formatter stringFromDate:self];
        [formatter release];
        return str;
    }
}

@end
