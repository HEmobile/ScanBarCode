//
//  DetailsViewController.h
//  ScanBarCodes
//
//  Created by Roberto Silva on 25/10/13.
//  Copyright (c) 2013 Infragistics. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailsVCDelegate
- (void)close;
@end

@interface DetailsViewController : UIViewController
@property (nonatomic, strong) NSString *barcode;
@property (nonatomic, weak) id<DetailsVCDelegate> delegate;
@end
