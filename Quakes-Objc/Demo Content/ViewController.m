//
//  ViewController.m
//  Quakes-Objc
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LSILog.h"
#import "LSIFirstResponder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Hey Quakes!");
    
    // How do I create a first responder object?
    LSIFirstResponder *responder = [[LSIFirstResponder alloc] init];

    NSLog(@"responder: %@", responder);
    NSLog(@"name: %@", responder.name);
    
    // Objects will be nil / null
    // int / float / double / bool will be 0 (NO)
    
    responder.name = @"John";
    NSLog(@"name: %@", responder.name);
    
    //Swift Closure
//    let addNumbers = {(a: int, b: int)-> Int in
//         return a + b
//    })
    
    // Objectvive C closure returnType (^blockName)(parameter) = ^returnType(parameters){
    // };
    // blockName()
    
    
    // Creates a Block Syntax Closure in Objective C (anon function similar to closure in swift)
    int (^addNumbers)(int a, int b) = ^int(int a, int b) {
        return a + b;
    };
    
    int result = addNumbers(15, 27);
    NSLog(@"Result: %d", result);
}

// Create an Objective C method that has a closure
//methodName:( returnType (^)(parameterTypes) )
- (void)doWorkAndCallCompletionHandler:(void (^)(int temperature))completion {
    // API Call to get temperature
    NSLog(@"Getting temperature from api: ");
    
    completion(66);
}


@end
