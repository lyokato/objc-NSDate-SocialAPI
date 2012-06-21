#import <Foundation/Foundation.h>

@interface NSDate (SocialAPI)
+ (NSDate *)dateFromTwitterAPIDateString:(NSString *)string;
+ (NSDate *)dateFromISO8601DateString:(NSString *)string;
- (NSString *)howLongAgoFrom:(NSDate *)date;
- (NSString *)howLongAgoFromNow;
@end

