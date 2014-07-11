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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendFeeling:(id)sender {
    self.notificationLabel.text = @"loading..";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *data = @{@"feeling": @{@"sad":          @"sad",
                                         @"message":      self.messageTextField.text,
                                         @"ip":           @"157.253.23.123",
                                         @"country_name": @"Colombia",
                                         @"country_code": @"CO" }};

    [manager POST:@"http://ifeelsad.herokuapp.com/feelings.json"
       parameters:data
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              self.notificationLabel.text = @"";
              NSLog(@"%@", responseObject);
              self.sadCountLabel.text     = responseObject[@"country_code"];
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              self.notificationLabel.text = @"Error posting";
          }];
    
    self.messageTextField.text = @"";
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
