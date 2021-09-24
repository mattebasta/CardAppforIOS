//
//  AddCardViewController.h
//  Card
//
//  Created by Matte on 23/09/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class AddCardViewController;
@protocol AddCardDelegate //nome del delegate


//conferma azione
-(void)saveCardName:(NSString *)corpName clientId:(NSString *)clientId;

@end


@interface AddCardViewController : UIViewController

@property (nonatomic,weak) id <AddCardDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
