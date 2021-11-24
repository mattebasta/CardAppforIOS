//
//  AddCardViewController.m
//  Card
//
//  Created by Matte on 23/09/21.
//

#import "AddCardViewController.h"

@interface AddCardViewController ()

@property (weak, nonatomic) IBOutlet UITextField *corpNameField;

@property (weak, nonatomic) IBOutlet UITextField *clientIdField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *cardColor;

@end

@implementation AddCardViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"New Card";

}



- (IBAction)saveCardButton:(UIBarButtonItem *)sender {

    if ((self.corpNameField.text.length && self.clientIdField.text.length) > 0) {
        
        [self.delegate saveCardName:self.corpNameField.text clientId:self.clientIdField.text];
        
    }
    else{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing Data" message:@"Make sure all field are completed" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
            NSLog(@"OK pressed");
        }];
        [alert addAction:actionOK];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
- (IBAction)selectedCardColor:(id)sender {
    
    switch (self.cardColor.selectedSegmentIndex) {
        case 0:
            [self.delegate sendCardColor:[UIColor systemRedColor]];
            break;
        case 1:
            [self.delegate sendCardColor:[UIColor systemGreenColor]];
            break;
        case 2:
            [self.delegate sendCardColor:[UIColor systemPurpleColor]];
            break;
        case 3:
            [self.delegate sendCardColor:[UIColor systemTealColor]];
            break;
        default:
            break;
    }
}


@end
