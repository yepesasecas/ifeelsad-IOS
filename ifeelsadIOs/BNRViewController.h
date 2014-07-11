//
//  BNRViewController.h
//  ifeelsadIOs
//
//  Created by Andres Yepes on 7/9/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel *notificationLabel;
@property (nonatomic, weak) IBOutlet UILabel *sadCountLabel;
@property (nonatomic, weak) IBOutlet UITextField *messageTextField;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loading;
@end
