//
//  LSIQuakeFetcher.m
//  Quakes-Objc
//
//  Created by Austin Potts on 3/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIQuakeFetcher.h"

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
    
}


@end
