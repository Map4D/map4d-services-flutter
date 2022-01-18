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
  if ([@"place#detail" isEqualToString:call.method]) {
    NSString *placeId = call.arguments[@"id"];
    NSLog(@"SS | get place detail: %@", placeId);
    [_places fetchPlaceDetailById:placeId result:result];
    return;
  }
  
  if ([@"place#text-search" isEqualToString:call.method]) {
    [_places fetchPlacesWithTextSearchData:call.arguments result:result];
    return;
  }
  
  NSLog(@"[Map4dServicesPlugin] Method not implemented: %@", call.method);
  result(FlutterMethodNotImplemented);
}

@end
