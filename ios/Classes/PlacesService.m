//
//  PlacesService.m
//  map4d_services
//
//  Created by Huy Dang on 1/18/22.
//

#import "PlacesService.h"
#import <Map4dServices/Map4dServices.h>

@interface PlacesService ()
@property(nonatomic, readonly, nonnull) MFServices *services;
@end

@implementation PlacesService

- (instancetype)init {
  self = [super init];
  if (self) {
    _services = [[MFServices alloc] init];
  }
  return self;
}

- (void)fetchPlaceDetailById:(NSString *)placeId result:(FlutterResult)result {
  
  NSString *path = [@"/sdk/place/detail/" stringByAppendingString:placeId];
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:path];
  
  [_services dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, id<MFServiceError> _Nullable error) {
    if (error != nil) {
      result(@{
        @"code": error.code,
        @"message": error.message
      });
    }
    
    NSError *parseError = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
    NSLog(@"SS | dictionary: %@", dictionary);
    result(dictionary);
  }];
}

- (void)fetchPlacesWithTextSearchData:(NSDictionary *)data result:(FlutterResult)result {
  MFTextSearchParams *params = [[MFTextSearchParams alloc] initWithText:data[@"text"]];
  
  params.types = data[@"types"];

  NSDictionary *location = data[@"location"];
  if (location != nil) {
    params.location = [[MFLocationComponent alloc] initWithLatitude:[location[@"lat"] doubleValue]
                                                          longitude:[location[@"lng"] doubleValue]];
  }
  
  NSNumber *datetime = data[@"datetime"];
  if (datetime != nil) {
    params.datetime = [NSDate dateWithTimeIntervalSince1970:datetime.longValue / 1000.];
  }
  
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/text-search"];
  request.params = params;
  
  [_services dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, id<MFServiceError>  _Nullable error) {
    if (error != nil) {
      result(@{
        @"code": error.code,
        @"message": error.message
      });
    }
    
    NSError *parseError = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
    NSLog(@"SS | dictionary: %@", dictionary);
    result(dictionary);
  }];
}

@end
