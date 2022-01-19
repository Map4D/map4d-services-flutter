//
//  PlacesService.m
//  map4d_services
//
//  Created by Huy Dang on 1/18/22.
//

#import "PlacesService.h"
#import "SClient.h"
#import "SConverter.h"

@implementation PlacesService

- (void)fetchPlaceDetailById:(NSString *)placeId result:(FlutterResult)result {
  
  NSString *path = [@"/sdk/place/detail/" stringByAppendingString:placeId];
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:path];
  [SClient fireRequest:request result:result];
}

- (void)fetchTextSearchWithData:(NSDictionary *)data result:(FlutterResult)result {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/text-search"];
  MFTextSearchParams *params = [[MFTextSearchParams alloc] initWithText:data[@"text"]];
  
  params.types = data[@"types"];
  params.location = [SConverter toLocationComponent:data[@"location"]];
  params.datetime = [SConverter toDate:data[@"datetime"]];
  
  request.params = params;
  [SClient fireRequest:request result:result];
}

- (void)fetchNearbySearchWithData:(NSDictionary *)data result:(FlutterResult)result {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/nearby-search"];
  MFNearbySearchParams *params = [[MFNearbySearchParams alloc] initWithLocation:[SConverter toLocationComponent:data[@"location"]]
                                                                         radius:[SConverter toInt64:data[@"radius"]]
                                                                           text:data[@"text"]];
  params.types = data[@"types"];
  params.tags = data[@"tags"];
  params.datetime = [SConverter toDate:data[@"datetime"]];
  
  request.params = params;
  [SClient fireRequest:request result:result];
}

- (void)fetchViewboxSearchWithData:(NSDictionary *)data result:(FlutterResult)result {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/viewbox-search"];
  MFViewboxSearchParams *params = [[MFViewboxSearchParams alloc] initWithViewbox:[SConverter toViewbox:data[@"viewbox"]]
                                                                            text:data[@"text"]];
  params.types = data[@"types"];
  params.tags = data[@"tags"];
  params.datetime = [SConverter toDate:data[@"datetime"]];
  
  request.params = params;
  [SClient fireRequest:request result:result];
}

- (void)fetchSuggestionsWithData:(NSDictionary *)data result:(FlutterResult)result {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/autosuggest"];
  MFSuggestionParams *params = [[MFSuggestionParams alloc] initWithText:data[@"text"]];
  params.acronym = [SConverter toBool:data[@"acronym"]];
  params.location = [SConverter toLocationComponent:data[@"location"]];
  
  request.params = params;
  [SClient fireRequest:request result:result];
}

@end
