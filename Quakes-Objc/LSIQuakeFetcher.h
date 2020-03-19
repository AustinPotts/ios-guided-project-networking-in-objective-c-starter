//
//  LSIQuakeFetcher.h
//  Quakes-Objc
//
//  Created by Austin Potts on 3/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIQuake.h"

//Swift Type Alias
typedef void (^LSIQuakeFetcherCompletion)(NSArray<LSIQuake *> * _Nullable quakes, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN



@interface LSIQuakeFetcher : NSObject

- (void)fetchQuakesInTimeInterval:(NSDateInterval *)timeInterval
                  completionBlock:(LSIQuakeFetcherCompletion)completion;

//                  completionBlock:(void (^)(NSArray<LSIQuake *> *quakes, NSError *error))completion;


- (void)fetchQuakesWithCompletionBlock:(LSIQuakeFetcherCompletion)completion;
    



@end

NS_ASSUME_NONNULL_END
