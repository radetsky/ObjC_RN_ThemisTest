//
//  SecureCellSealMode.m
//  ObjC_RN_ThemisTest
//
//  Created by Oleksii Radetskyi on 07.12.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SecureCellSealMode.h"

@import themis;

@implementation SecureCellSealModeViewController
{
    NSData *txt;
    NSData *ctx;
    NSData *pwd;
    NSData *symkey;
    NSData *encrypted;
    NSData *decrypted;
}

- (IBAction)ecryptWithPasswordTouchUp:(id)sender {
    if ([self.plaintext.text isEqual: @""] ||
        [self.context.text isEqual: @""] ||
        [self.password.text isEqual: @""] ) {
        return;
    }
    TSCellSeal *cell = [[TSCellSeal alloc] initWithPassphrase:self.password.text];
    txt = [self.plaintext.text dataUsingEncoding:NSUTF8StringEncoding];
    ctx = [self.context.text dataUsingEncoding:NSUTF8StringEncoding];
    encrypted = [cell encrypt:txt context:ctx];
    assert(encrypted.length > txt.length);
    self.encryptedTextView.text = [encrypted base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}
- (IBAction)encryptWithSymKeyTouchUp:(id)sender {
    if ([self.plaintext.text isEqual: @""] ||
        [self.context.text isEqual:@""] ||
        [self.symKeyTextView.text isEqual:@""]) {
        return; // Do not encrypt anything without all required params
    }
    symkey = [[NSData alloc] initWithBase64EncodedString:self.symKeyTextView.text options:0];
    TSCellSeal *cell = [[TSCellSeal alloc] initWithKey:symkey];
    
    txt = [self.plaintext.text dataUsingEncoding:NSUTF8StringEncoding];
    ctx = [self.context.text dataUsingEncoding:NSUTF8StringEncoding];
    encrypted = [cell encrypt:txt context:ctx];
    assert(encrypted.length > txt.length);
    self.encryptedTextView.text = [encrypted base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
}
- (IBAction)decryptWithPasswordTouchUp:(id)sender {
    NSError *error;

    if ([self.encryptedTextView.text isEqual: @""] ||
        [self.context.text isEqual: @""] ||
        [self.password.text isEqual: @""] ) {
        return;
    }
    TSCellSeal *cell = [[TSCellSeal alloc] initWithPassphrase:self.password.text];
    ctx = [self.context.text dataUsingEncoding:NSUTF8StringEncoding];
    NSData *enc = [[NSData alloc] initWithBase64EncodedString:self.encryptedTextView.text options:0];
    
    decrypted = [cell decrypt:enc
                      context:ctx
                        error:&error];
    
    if (error) {
        NSLog(@"Error: %@", error);
        self.decryptedTextView.text = @"Error :(";
    } else {
        self.decryptedTextView.text = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    }
}
- (IBAction)decryptWithSymKeyTouchUp:(id)sender {
    NSError *error;
    
    if ([self.encryptedTextView.text isEqual: @""] ||
        [self.context.text isEqual: @""] ||
        [self.symKeyTextView.text isEqual: @""] ) {
        return;
    }
    
    symkey = [[NSData alloc] initWithBase64EncodedString:self.symKeyTextView.text options:0];
    NSLog(@"symkey:%@",symkey);

    TSCellSeal *cell = [[TSCellSeal alloc] initWithKey:symkey];
    
    ctx = [self.context.text dataUsingEncoding:NSUTF8StringEncoding];
    NSData *enc = [[NSData alloc] initWithBase64EncodedString:self.encryptedTextView.text options:0];
    NSLog(@"enc:%@",enc);
    
    decrypted = [cell decrypt:enc
                      context:ctx
                        error:&error];
    
    if (error) {
        NSLog(@"Error: %@", error);
        self.decryptedTextView.text = @"Error :(";
    } else {
        self.decryptedTextView.text = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    }

}


@end
