//
//  SConverter.m
//  map4d_services
//
//  Created by Huy Dang on 1/19/22.
//

#import "SConverter.h"

@implementation SConverter

+ (BOOL)toBool:(NSNumber *)data {
  return data.boolValue;
}

+ (int64_t)toInt64:(NSNumber *)number {
  return number.longLongValue;
}

+ (double)toDouble:(NSNumber *)number {
  return number.doubleValue;
}

+ (NSDate *)toDate:(NSNumber *)number {
  if (number == nil) {
    return nil;
  }
  return [NSDate dateWithTimeIntervalSince1970:number.longLongValue / 1000.];
}

+ (MFLocationComponent *)toLocationComponent:(NSDictionary *)data {
  if (data == nil) {
    return nil;
  }
  NSString *alias = data[@"alias"];
  double latitude = [data[@"lat"] doubleValue];
  double longitude = [data[@"lng"] doubleValue];
  return [[MFLocationComponent alloc] initWithLatitude:latitude longitude:longitude alias:alias];
}

+ (MFViewboxComponent *)toViewbox:(NSDictionary *)data {
  MFLocationComponent *southwest = [SConverter toLocationComponent:data[@"southwest"]];
  MFLocationComponent *northeast = [SConverter toLocationComponent:data[@"northeast"]];
  return [[MFViewboxComponent alloc] initWithSouthwest:southwest.coordinate northeast:northeast.coordinate];
}

@end
