//
//  SConverter.h
//  map4d_services
//
//  Created by Huy Dang on 1/19/22.
//

#ifndef SConverter_h
#define SConverter_h

#import <CoreLocation/CoreLocation.h>
#import <Map4dServices/Map4dServices.h>

@interface SConverter : NSObject

+ (BOOL)toBool:(NSNumber *)data;
+ (int64_t)toInt64:(NSNumber *)number;
+ (double)toDouble:(NSNumber *)number;
+ (NSDate *)toDate:(NSNumber *)number;

+ (MFLocationComponent *)toLocationComponent:(NSDictionary *)data;
+ (NSArray<MFLocationComponent *> *)toLocationComponentArray:(NSArray *)data;

+ (MFViewboxComponent *)toViewbox:(NSDictionary *)data;

+ (MFTravelMode)toTravelMode:(NSNumber *)data;
+ (MFRouteWeighting)toRouteWeighting:(NSNumber *)data;
+ (MFLanguageResult)toLanguageResult:(NSNumber *)data;

+ (MFRouteRestriction *)toRouteAvoid:(NSDictionary *)data;
+ (NSArray<MFRouteTypeRestriction *> *)toRouteTypeAvoidArray:(NSArray *)data;

@end

#endif /* SConverter_h */
