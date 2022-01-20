//
//  SRequest.m
//  map4d_services
//
//  Created by Huy Dang on 1/20/22.
//

#import "SRequest.h"
#import "SConverter.h"

@implementation SRequest

#pragma mark - Geocode

+ (MFServiceRequest *)buildGeocodingRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/v2/geocode"];
  MFGeocodeParams *params = [[MFGeocodeParams alloc] initWithAddress:data[@"address"]];
  params.location = [SConverter toLocationComponent:data[@"location"]];
  params.viewbox = [SConverter toViewbox:data[@"viewbox"]];
  
  request.params = params;
  return request;
}

#pragma mark - Place

+ (MFServiceRequest *)buildPlaceDetailRequestWithId:(NSString *)placeId {
  NSString *path = [@"/sdk/place/detail/" stringByAppendingString:placeId];
  return [[MFServiceRequest alloc] initWithPath:path];
}

+ (MFServiceRequest *)buildTextSearchRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/text-search"];
  MFTextSearchParams *params = [[MFTextSearchParams alloc] initWithText:data[@"text"]];
  
  params.types = data[@"types"];
  params.location = [SConverter toLocationComponent:data[@"location"]];
  params.datetime = [SConverter toDate:data[@"datetime"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildNearbySearchRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/nearby-search"];
  MFNearbySearchParams *params = [[MFNearbySearchParams alloc] initWithLocation:[SConverter toLocationComponent:data[@"location"]]
                                                                         radius:[SConverter toInt64:data[@"radius"]]
                                                                           text:data[@"text"]];
  params.types = data[@"types"];
  params.tags = data[@"tags"];
  params.datetime = [SConverter toDate:data[@"datetime"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildViewboxSearchRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/viewbox-search"];
  MFViewboxSearchParams *params = [[MFViewboxSearchParams alloc] initWithViewbox:[SConverter toViewbox:data[@"viewbox"]]
                                                                            text:data[@"text"]];
  params.types = data[@"types"];
  params.tags = data[@"tags"];
  params.datetime = [SConverter toDate:data[@"datetime"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildSuggestionsRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/autosuggest"];
  MFSuggestionParams *params = [[MFSuggestionParams alloc] initWithText:data[@"text"]];
  params.acronym = [SConverter toBool:data[@"acronym"]];
  params.location = [SConverter toLocationComponent:data[@"location"]];
  
  request.params = params;
  return request;
}

#pragma mark - Route

+ (MFServiceRequest *)buildDirectionsRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/route"];
  
  MFLocationComponent *origin = [SConverter toLocationComponent:data[@"origin"]];
  MFLocationComponent *destination = [SConverter toLocationComponent:data[@"destination"]];
  MFDirectionsParams *params = [[MFDirectionsParams alloc] initWithOrigin:origin destination:destination];
  params.waypoints = [SConverter toLocationComponentArray:data[@"points"]];
  params.mode = [SConverter toTravelMode:data[@"mode"]];
  params.language = [SConverter toLanguageResult:data[@"language"]];
  params.weighting = [SConverter toRouteWeighting:data[@"weighting"]];
  params.avoid = [SConverter toRouteAvoid:data[@"avoid"]];
  params.avoidRouteTypes = [SConverter toRouteTypeAvoidArray:data[@"avoidRoads"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildRouteETARequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/route/eta"];
  
  NSArray<MFLocationComponent *> *origins = [SConverter toLocationComponentArray:data[@"origins"]];
  MFLocationComponent *destination = [SConverter toLocationComponent:data[@"destination"]];
  MFRouteETAParams *params = [[MFRouteETAParams alloc] initWithOrigins:origins destination:destination];
  params.mode = [SConverter toTravelMode:data[@"mode"]];
  params.language = [SConverter toLanguageResult:data[@"language"]];
  params.weighting = [SConverter toRouteWeighting:data[@"weighting"]];
  params.avoid = [SConverter toRouteAvoid:data[@"avoid"]];
  params.avoidRouteTypes = [SConverter toRouteTypeAvoidArray:data[@"avoidRoads"]];
  
  request.params = params;
  request.method = MFRequestMethodPost;
  return request;
}

+ (MFServiceRequest *)buildDistanceMatrixRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/route/matrix"];
  
  NSArray<MFLocationComponent *> *origins = [SConverter toLocationComponentArray:data[@"origins"]];
  NSArray<MFLocationComponent *> *destinations = [SConverter toLocationComponentArray:data[@"destinations"]];
  MFDistanceMatrixParams *params = [[MFDistanceMatrixParams alloc] initWithOrigins:origins destinations:destinations];
  params.mode = [SConverter toTravelMode:data[@"mode"]];
  params.language = [SConverter toLanguageResult:data[@"language"]];
  params.weighting = [SConverter toRouteWeighting:data[@"weighting"]];
  params.avoid = [SConverter toRouteAvoid:data[@"avoid"]];
  params.avoidRouteTypes = [SConverter toRouteTypeAvoidArray:data[@"avoidRoads"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildGraphRouteRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/route/graph"];
  
  NSArray<MFLocationComponent *> *points = [SConverter toLocationComponentArray:data[@"points"]];
  MFGraphRouteParams *params = [[MFGraphRouteParams alloc] initWithLocations:points];
  params.mode = [SConverter toTravelMode:data[@"mode"]];
  params.language = [SConverter toLanguageResult:data[@"language"]];
  params.weighting = [SConverter toRouteWeighting:data[@"weighting"]];
  params.avoid = [SConverter toRouteAvoid:data[@"avoid"]];
  params.avoidRouteTypes = [SConverter toRouteTypeAvoidArray:data[@"avoidRoads"]];
  
  request.params = params;
  return request;
}

@end
