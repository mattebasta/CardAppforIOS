//
//  CardDetailTableViewController.h
//  Card
//
//  Created by Matte on 24/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardDetailTableViewController : UITableViewController

@property (nonatomic, strong) NSString *compNameDetail;
@property (nonatomic, strong) NSString *clientIdDetail;
@property (readonly) CIImage *outputImage;

@end

NS_ASSUME_NONNULL_END
