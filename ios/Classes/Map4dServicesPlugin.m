#import "Map4dServicesPlugin.h"
#import "PlacesService.h"

@interface Map4dServicesPlugin ()

@property(nonatomic, readonly, nonnull) PlacesService* places;

@end

@implementation Map4dServicesPlugin

- (instancetype)init {
  if (self = [super init]) {
    _places = [[PlacesService alloc] init];
  }
  return self;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"map4d_services"
                                                              binaryMessenger:[registrar messenger]];
  Map4dServicesPlugin* instance = [[Map4dServicesPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  /* Place | Place Detail */
  if ([@"place#detail" isEqualToString:call.method]) {
    NSString *placeId = call.arguments[@"id"];
    [_places fetchPlaceDetailById:placeId result:result];
    return;
  }
  
  /* Place | Text Search */
  if ([@"place#text-search" isEqualToString:call.method]) {
    [_places fetchTextSearchWithData:call.arguments result:result];
    return;
  }
  
  /* Place | Nearby Search */
  if ([@"place#nearby-search" isEqualToString:call.method]) {
    [_places fetchNearbySearchWithData:call.arguments result:result];
    return;
  }
  
  /* Place | Viewbox Search */
  if ([@"place#viewbox-search" isEqualToString:call.method]) {
    [_places fetchViewboxSearchWithData:call.arguments result:result];
    return;
  }
  
  /* Place | Suggestion */
  if ([@"place#autosuggest" isEqualToString:call.method]) {
    [_places fetchSuggestionsWithData:call.arguments result:result];
    return;
  }
  
  NSLog(@"[Map4dServicesPlugin] Method not implemented: %@", call.method);
  result(FlutterMethodNotImplemented);
}

@end
