//
//  LSIQuakeFetcher.m
//  Quakes-Objc
//
//  Created by Austin Potts on 3/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIQuakeFetcher.h"
#import "LSIErrors.h"
#import "LSIQuake.h"
#import "LSIQuakeResults.h"

static NSString *baseURLString = @"https://earthquake.usgs.gov/fdsnws/event/1/query";

@implementation LSIQuakeFetcher

- (void)fetchQuakesWithCompletionBlock:(LSIQuakeFetcherCompletion)completion {
    
    // create a time interval to fetch with
    NSDate *endDate = [NSDate date];
    NSDate *startDate = [NSCalendar.currentCalendar dateByAddingUnit:NSCalendarUnitDay value:-1 toDate:endDate options:0];
    
    NSDateInterval *dateInterval = [[NSDateInterval alloc] initWithStartDate:startDate endDate:endDate];
    
    [self fetchQuakesInTimeInterval:dateInterval completionBlock:completion];
    
}

- (void)fetchQuakesInTimeInterval:(NSDateInterval *)timeInterval
                  completionBlock:(LSIQuakeFetcherCompletion)completion {
    
    // Use url componenets to build up query
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
    NSISO8601DateFormatter *formatter = [[NSISO8601DateFormatter alloc] init];
    NSString *startDateString = [formatter stringFromDate:timeInterval.startDate];
    NSString *endDateString = [formatter stringFromDate:timeInterval.endDate];
    
    //Make query items
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"format" value:@"geojson"],
        [NSURLQueryItem queryItemWithName:@"starttime" value:startDateString],
        [NSURLQueryItem queryItemWithName:@"endtime" value:endDateString]
    ];
    
    NSURL *url = urlComponents.URL;
    NSLog(@"URL: %@", url);
    
    //Use url sessions
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url
                                                           completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSError *dataError = errorWithMessage(@"Data is nil from API Response", 1002);
            completion(nil, dataError);
            return;
        }
        
        NSError *jsonError = nil; // no error before API call, clean slate
        
        NSDictionary *quakeDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) { // if json error is no longer nil then we have a problem
            completion(nil, jsonError);
            return;
        }
        
        //Decode the JSOn using model object
        LSIQuakeResults *quakeResults = [[LSIQuakeResults alloc] initWithDictionary:quakeDictionary];
        completion(quakeResults.quakes, nil);
        
    }];
    [task resume];
}


@end
