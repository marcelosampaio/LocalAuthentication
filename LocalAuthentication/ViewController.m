//
//  ViewController.m
//  LocalAuthentication
//
//  Created by Marcelo Sampaio on 5/12/15.
//  Copyright (c) 2015 Marcelo Sampaio. All rights reserved.
//
//  Reference: https://www.secsign.com/fingerprint-validation-as-an-alternative-to-passcodes/

#import "ViewController.h"

@interface ViewController ()

@end

@import LocalAuthentication;

@implementation ViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Get the local authentication context:
    LAContext *context = [[LAContext alloc] init];
    
    // Test if fingerprint authentication is available on the device and a fingerprint has been enrolled.
    if ([context canEvaluatePolicy: LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Authenticate for server login" reply:^(BOOL success, NSError *authenticationError){
            if (success) {
                NSLog(@"Fingerprint validated.");
            }
            else {
                NSLog(@"Fingerprint validation failed: %@.", authenticationError.localizedDescription);
            }
        }];
    }else{
        NSLog(@"NO");
    }

}






@end
