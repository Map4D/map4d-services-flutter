//
//  SClient.m
//  map4d_services
//
//  Created by Huy Dang on 1/19/22.
//

#import "SClient.h"

@implementation SClient

static MFServices *_services = nil;

+ (MFServices *)services {
  if (_services == nil) {
    _services = [[MFServices alloc] init];
  }
  return _services;
}

+ (void)fireRequest:(MFServiceRequest *)request result:(FlutterResult)result {
  [SClient.services dataTaskWithRequest:request
                      completionHandler:^(NSData * _Nullable data, id<MFServiceError>  _Nullable error) {
    if (error != nil) {
      result(@{
        @"code": error.code,
        @"message": error.message
      });
    }
    
    NSError *parseError = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
    
    if (parseError != nil) {
      result(@{
        @"code": [NSString stringWithFormat:@"%ld", parseError.code],
        @"message": parseError.localizedDescription
      });
    }
    
    //NSLog(@"SS | dictionary: %@", dictionary);
    result(dictionary);
  }];
}

@end
