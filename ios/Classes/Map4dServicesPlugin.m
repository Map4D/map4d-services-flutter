#import "Map4dServicesPlugin.h"
#import "SRequest.h"
#import "SClient.h"

@implementation Map4dServicesPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"map4d_services"
                                                              binaryMessenger:[registrar messenger]];
  Map4dServicesPlugin* instance = [[Map4dServicesPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  
  /* Geocode */
  if ([@"geocode#geocode" isEqualToString:call.method]) {
    [SClient fireRequest:[SRequest buildGeocodingRequestWithData:call.arguments] result:result];
    return;
  }

  /* Place | Place Detail */
  if ([@"place#detail" isEqualToString:call.method]) {
    NSString *placeId = call.arguments[@"id"];
    [SClient fireRequest:[SRequest buildPlaceDetailRequestWithId:placeId] result:result];
    return;
  }
  
  /* Place | Text Search */
  if ([@"place#text-search" isEqualToString:call.method]) {
    [SClient fireRequest:[SRequest buildTextSearchRequestWithData:call.arguments] result:result];
    return;
  }
  
  /* Place | Nearby Search */
  if ([@"place#nearby-search" isEqualToString:call.method]) {
    [SClient fireRequest:[SRequest buildNearbySearchRequestWithData:call.arguments] result:result];
    return;
  }
  
  /* Place | Viewbox Search */
  if ([@"place#viewbox-search" isEqualToString:call.method]) {
    [SClient fireRequest:[SRequest buildViewboxSearchRequestWithData:call.arguments] result:result];
    return;
  }
  
  /* Place | Suggestion */
  if ([@"place#autosuggest" isEqualToString:call.method]) {
    [SClient fireRequest:[SRequest buildSuggestionsRequestWithData:call.arguments] result:result];
    return;
  }
  
  /* Route | Directions */
  if ([@"route#route" isEqualToString:call.method]) {
    [SClient fireRequest:[SRequest buildDirectionsRequestWithData:call.arguments] result:result];
    return;
  }
  
  /* Route | ETA */
  if ([@"route#eta" isEqualToString:call.method]) {
    [SClient fireRequest:[SRequest buildRouteETARequestWithData:call.arguments] result:result];
    return;
  }
  
  /* Route | Matrix */
  if ([@"route#matrix" isEqualToString:call.method]) {
    [SClient fireRequest:[SRequest buildDistanceMatrixRequestWithData:call.arguments] result:result];
    return;
  }
  
  /* Route | Graph */
  if ([@"route#graph" isEqualToString:call.method]) {
    [SClient fireRequest:[SRequest buildGraphRouteRequestWithData:call.arguments] result:result];
    return;
  }
  
  NSLog(@"[Map4dServicesPlugin] Method not implemented: %@", call.method);
  result(FlutterMethodNotImplemented);
}

@end
