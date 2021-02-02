//
//  LoginVC.h
//  inviting-members-objc
//
//  Created by Eric Giannini on 6/18/18.
//  Copyright © 2018 Nexmo, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Stitch;

@interface LoginVC : UIViewController

@property (retain, nonatomic) NXMConversationClient *client;

@property (weak, nonatomic) IBOutlet UILabel *statusLbl;


@end

