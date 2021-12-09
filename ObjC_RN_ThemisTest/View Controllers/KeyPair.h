//
//  KeyPair.h
//  ObjC_RN_ThemisTest
//
//  Created by Oleksii Radetskyi on 06.12.2021.
//

#ifndef KeyPair_h
#define KeyPair_h

#import <UIKit/UIkit.h>

@interface KeyPairViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *pvtKeyTxt;
@property (weak, nonatomic) IBOutlet UITextView *pubKeyTxt;

@end

#endif /* KeyPair_h */
