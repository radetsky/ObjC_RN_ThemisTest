//
//  KeyPair.m
//  ObjC_RN_ThemisTest
//
//  Created by Oleksii Radetskyi on 06.12.2021.
//

#import <Foundation/Foundation.h>
#import "KeyPair.h"

@import themis;

@implementation KeyPairViewController
{
    NSData* privateKey;
    NSData* publicKey;
}
- (IBAction)generateTouchUp:(id)sender {
    
    NSLog(@"Generate new asymmetric key pair");

    // TODO: добавить поддержку TSKeyGenAsymmetricAlgorithmEC
    TSKeyGen *keypair =
        [[TSKeyGen alloc] initWithAlgorithm:TSKeyGenAsymmetricAlgorithmRSA];

    privateKey = keypair.privateKey;
    publicKey  = keypair.publicKey;
    
    NSString *pvtKey64 = [privateKey base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    self.pvtKeyTxt.text = pvtKey64;
    
    NSString *pubKey64 = [publicKey base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    self.pubKeyTxt.text = pubKey64;
    
}
- (IBAction)copyPrivateKey:(id)sender {
    NSLog(@"Copy private key");
    NSString *txt = [privateKey base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = txt;
}

- (IBAction)copyPublicKey:(id)sender {
    NSLog(@"Copy public key");
    NSString *txt = [publicKey base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = txt;
}

@end
