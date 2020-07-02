//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSAppleSignInButton.h"
#import "AWSAppleSignInProvider.h"
#import<AuthenticationServices/AuthenticationServices.h>

@interface AWSAppleSignInButton()

@property (nonatomic, strong) id<AWSSignInProvider> signInProvider;

@property (nonatomic, strong) UIControl *appleButton;
@property (nonatomic, strong) UIStackView *appleStackView;

@end

@implementation AWSAppleSignInButton

@synthesize delegate;
@synthesize buttonStyle;

- (id)initWithCoder:(NSCoder*)aDecoder {

    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
        [self createAppleButton];
    }
    return self;
}

- (void)commonInit {
    _signInProvider = [AWSAppleSignInProvider sharedInstance];
}

- (void)createAppleButton {
    if (@available(iOS 13, *)) {
        _appleButton = [[ASAuthorizationAppleIDButton alloc] init];
        [_appleButton addTarget:self action:@selector(logInWithProvider:) forControlEvents:UIControlEventTouchUpInside];
        CGRect buttonFrame = _appleButton.frame;
        buttonFrame.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
        _appleButton.frame = buttonFrame;
        [self addSubview:_appleButton];
    }
}

- (void)setSignInProvider:(id<AWSSignInProvider>)signInProvider {
    self.signInProvider = signInProvider;
}

- (void)logInWithProvider:(id)sender {

    [[AWSSignInManager sharedInstance] loginWithSignInProviderKey:[self.signInProvider identityProviderName]
                                                completionHandler:^(id result, NSError *error) {
        [self.delegate onLoginWithSignInProvider:self.signInProvider result:result error:error];
    }];
}
@end
