//
//  SClient.h
//  map4d_services
//
//  Created by Huy Dang on 1/19/22.
//

#ifndef SClient_h
#define SClient_h

#import <Map4dServices/Map4dServices.h>
#import <Flutter/Flutter.h>

@interface SClient : NSObject

+ (void)fireRequest:(MFServiceRequest *)request result:(FlutterResult)result;

@end


#endif /* SClient_h */
