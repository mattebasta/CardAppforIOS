//
//  AddCardViewController.h
//  Card
//
//  Created by Matte on 23/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class AddCardViewController;
@protocol AddCardDelegate //delegate Name


//save the name,clientID and color of the card
-(void)saveCardName:(NSString *)corpName clientId:(NSString *)clientId cellBackground:(UIColor *)cellBackground;

@end


@interface AddCardViewController : UIViewController


@property (nonatomic,weak) id <AddCardDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
