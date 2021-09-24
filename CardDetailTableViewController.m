//
//  CardDetailTableViewController.m
//  Card
//
//  Created by Matte on 24/09/21.
//

#import "CardDetailTableViewController.h"


@interface CardDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *compNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idCodeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImageView;

@end

@implementation CardDetailTableViewController

-(CIImage *)createQrForString:(NSString *)qrString {
    NSData *stringData = [qrString dataUsingEncoding:NSISOLatin1StringEncoding];
    
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:self.clientIdDetail];
    
    return qrFilter.outputImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Detail";
    self.compNameLabel.text = self.compNameDetail;
    self.idCodeLabel.text = self.clientIdDetail;
    //[self.qrCodeImageView setImage:_outputImage];
}




@end
