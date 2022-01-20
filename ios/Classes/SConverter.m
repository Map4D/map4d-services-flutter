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

+ (NSArray<MFLocationComponent *> *)toLocationComponentArray:(NSArray *)data {
  if (data == nil || ![data isKindOfClass:[NSArray class]]) {
    return nil;
  }
  
  NSMutableArray<MFLocationComponent *> *locations = [NSMutableArray arrayWithCapacity:data.count];
  for (NSDictionary *dict in data) {
    MFLocationComponent *location = [SConverter toLocationComponent:dict];
    if (location != nil) {
      [locations addObject:location];
    }
  }
  return locations;
}

+ (MFViewboxComponent *)toViewbox:(NSDictionary *)data {
  if (data == nil) {
    return nil;
  }
  MFLocationComponent *southwest = [SConverter toLocationComponent:data[@"southwest"]];
  MFLocationComponent *northeast = [SConverter toLocationComponent:data[@"northeast"]];
  return [[MFViewboxComponent alloc] initWithSouthwest:southwest.coordinate northeast:northeast.coordinate];
}


+ (MFTravelMode)toTravelMode:(NSNumber *)data {
  int64_t mode = [SConverter toInt64:data];
  switch (mode) {
    case 0:
      return MFTravelModeCar;
    case 1:
      return MFTravelModeBike;
    case 2:
      return MFTravelModeFoot;
    case 3:
      return MFTravelModeMotorcycle;
    default:
      NSAssert(false, @"Unknown travel mode");
      return MFTravelModeCar;
  }
}

+ (MFRouteWeighting)toRouteWeighting:(NSNumber *)data {
  int64_t weighting = [SConverter toInt64:data];
  switch (weighting) {
    case 0:
      return MFRouteWeightingShortest;
    case 1:
      return MFRouteWeightingFastest;
    case 2:
      return MFRouteWeightingBalance;
    default:
      NSAssert(false, @"Unknown weighting");
      return MFRouteWeightingFastest;
  }
}

+ (MFLanguageResult)toLanguageResult:(NSNumber *)data {
  int64_t lang = [SConverter toInt64:data];
  if (lang == 0) {
    return MFLanguageResultEnglish;
  }
  return MFLanguageResultVietnamese;
}

+ (MFRouteRestriction *)toRouteAvoid:(NSDictionary *)data {
  //TODO:
  return nil;
}

+ (MFRouteType)toRouteType:(NSNumber *)data {
  int64_t type = [SConverter toInt64:data];
  switch (type) {
    case 0:
      return MFRouteTypeMotorway;
    case 1:
      return MFRouteTypeTrunk;
    case 2:
      return MFRouteTypeFerry;
    case 3:
      return MFRouteTypeBridge;
    case 4:
      return MFRouteTypeTunnel;
    default:
      NSAssert(false, @"Unknown route type");
      return MFRouteTypeMotorway;
  }
}

+ (NSArray<MFRouteTypeRestriction *> *)toRouteTypeAvoidArray:(NSArray *)data {
  if (data == nil || ![data isKindOfClass:[NSArray class]]) {
    return nil;
  }
  
  NSMutableArray<MFRouteTypeRestriction *> *types = [NSMutableArray arrayWithCapacity:data.count];
  for (NSNumber *index in data) {
    [types addObject:[[MFRouteTypeRestriction alloc] initWithType:[SConverter toRouteType:index]]];
  }

  return types;
}

@end
