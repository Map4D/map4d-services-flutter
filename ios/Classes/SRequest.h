//
//  SRequest.h
//  map4d_services
//
//  Created by Huy Dang on 1/20/22.
//

#ifndef SRequest_h
#define SRequest_h

#import <Foundation/Foundation.h>

@class MFServiceRequest;

@interface SRequest : NSObject

+ (MFServiceRequest *)buildGeocodingRequestWithData:(NSDictionary *)data;

+ (MFServiceRequest *)buildPlaceDetailRequestWithId:(NSString *)placeId;

+ (MFServiceRequest *)buildTextSearchRequestWithData:(NSDictionary *)data;

+ (MFServiceRequest *)buildNearbySearchRequestWithData:(NSDictionary *)data;

+ (MFServiceRequest *)buildViewboxSearchRequestWithData:(NSDictionary *)data;

+ (MFServiceRequest *)buildSuggestionsRequestWithData:(NSDictionary *)data;

+ (MFServiceRequest *)buildDirectionsRequestWithData:(NSDictionary *)data;

+ (MFServiceRequest *)buildDistanceMatrixRequestWithData:(NSDictionary *)data;

@end


#endif /* SRequest_h */
