//
//  PlacesService.h
//  map4d_services
//
//  Created by Huy Dang on 1/18/22.
//

#ifndef PlacesService_h
#define PlacesService_h

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

@interface PlacesService : NSObject

- (void)fetchPlaceDetailById:(NSString *)placeId result:(FlutterResult)result;
- (void)fetchPlacesWithTextSearchData:(NSDictionary *)data result:(FlutterResult)result;

@end


#endif /* PlacesService_h */
