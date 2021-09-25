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

-(CIImage *)createQrForString: (NSString *)qrString{
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    return qrFilter.outputImage;
}

-(UIImage *)createNonInterpolatedUIImageFromCIImage:(CIImage *)image withScale:(CGFloat)scale{
    //render the CIImage into a CGImage
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:image fromRect:image.extent];
    
    //rescale using core graphics
    UIGraphicsBeginImageContext(CGSizeMake(image.extent.size.width * scale, image.extent.size.width * scale));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    
    //get the image
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(cgImage);
    
    return scaledImage;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Detail";
    self.compNameLabel.text = self.compNameDetail;
    self.idCodeLabel.text = self.clientIdDetail;
    //Runtime Generation
    CIImage *qrCode = [self createQrForString:_clientIdDetail];
    UIImage *qrCodeImg = [self createNonInterpolatedUIImageFromCIImage:qrCode withScale:2*[[UIScreen mainScreen] scale]];
    //Runtime Generation
    self.qrCodeImageView.image = qrCodeImg;
}




@end
