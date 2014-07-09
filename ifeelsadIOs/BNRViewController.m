//
//  BNRViewController.m
//  ifeelsadIOs
//
//  Created by Andres Yepes on 7/9/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import "BNRViewController.h"
#import "AFHTTPRequestOperationManager.h"

@interface BNRViewController ()

@end

@implementation BNRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendFeeling:(id)sender {
    NSLog(@"POST Feeling");
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"foo": @"bar"};
    NSDictionary *data = @{@"feeling": @{@"sad":@"sad", @"ip":@"157.253.23.123", @"country_name":@"Colombia", @"country_code":@"CO" }};

    
    [manager POST:@"http://ifeelsad.herokuapp.com/feelings.json"
       parameters:data
          success:^(AFHTTPRequestOperation *operation, id responseObject) { NSLog(@"POST Success: %@", responseObject); }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) { NSLog(@"POST Error: %@", error); }];
}
- (IBAction)getFeelings:(id)sender {
    NSLog(@"GET Feelings");
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://ifeelsad.herokuapp.com/feelings"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) { NSLog(@"GET Success: %@", responseObject); }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) { NSLog(@"GET Error: %@", error); }];

}



@end
