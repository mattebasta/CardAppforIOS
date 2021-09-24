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

@end

@implementation AddCardViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"New Card";
    
}

- (IBAction)saveCardButton:(UIBarButtonItem *)sender {

    /*if (_corpNameField.text && _corpNameField.text.length > 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing Data" message:@"Make sure all field are completed" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
            NSLog(@"OK pressed");
        }];
        [alert addAction:actionOK];
        [self presentViewController:alert animated:YES completion:nil];
    }*/
    
        [self.delegate saveCardName:self.corpNameField.text clientId:self.clientIdField.text];
    
    
    
}


@end
