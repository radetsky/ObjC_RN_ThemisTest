//
//  SymmetricKey.m
//  ObjC_RN_ThemisTest
//
//  Created by Oleksii Radetskyi on 04.12.2021.
//

#import <UIKit/UIKit.h>
#import "SymmetricKey.h"

@import themis;

@implementation SymmetricKeyViewController
{
    NSData *masterKey;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.keyTxt.text = @"Hello, Themis users!\nPress Generate button to generate new symmetric key and press button Copy to copy base64-encoded value to the buffer.";
}

- (IBAction)gnrtTouchUp:(id)sender {
    NSLog(@"Generate new symmetric key");
    masterKey = TSGenerateSymmetricKey();
    NSString* txt = [masterKey base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    self.keyTxt.text = txt;
}

- (IBAction)cpTouchUp:(id)sender {
    NSLog(@"Copy the key to the buffer");
    if (masterKey == nil) return;
    
    NSString* txt = [masterKey base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = txt;
}
@end

