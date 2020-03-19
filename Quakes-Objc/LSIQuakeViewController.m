//
//  LSIQuakeViewController.m
//  Quakes-Objc
//
//  Created by Austin Potts on 3/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIQuakeViewController.h"
#import "LSIQuakeFetcher.h"
#import "LSIQuake.h"

@interface LSIQuakeViewController ()

//Create a property for quake fetcher
@property (nonatomic) LSIQuakeFetcher *quakeFetcher;

@end

@implementation LSIQuakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.quakeFetcher = [[LSIQuakeFetcher alloc] init];
    
    [self.quakeFetcher fetchQuakesInTimeInterval:nil completionBlock:^(NSArray<LSIQuake *> * _Nonnull quakes, NSError * _Nonnull error) {
        
        if (error) {
            NSLog(@"Error fetching quakes %@", error); //FIXME Update UI for user
            return;
        }
        
        NSLog(@"Quakes %ld", quakes.count);
    }];
    
    //We dont need to return anythign since we are just getting parameters
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
