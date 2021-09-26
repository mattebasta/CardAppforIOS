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


//save the name,clientID
-(void)saveCardName:(NSString *)corpName clientId:(NSString *)clientId;

//send the color of the card
-(void)sendCardColor:(UIColor *)choosenColor;

@end


@interface AddCardViewController : UIViewController


@property (nonatomic,weak) id <AddCardDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
