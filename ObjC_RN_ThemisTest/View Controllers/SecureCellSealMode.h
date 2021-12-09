//
//  SecureCellSealMode.h
//  ObjC_RN_ThemisTest
//
//  Created by Oleksii Radetskyi on 07.12.2021.
//

#ifndef SecureCellSealMode_h
#define SecureCellSealMode_h

@interface SecureCellSealModeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *plaintext;
@property (weak, nonatomic) IBOutlet UITextField *context;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextView *symKeyTextView;
@property (weak, nonatomic) IBOutlet UITextView *encryptedTextView;
@property (weak, nonatomic) IBOutlet UITextView *decryptedTextView;

@property (weak, nonatomic) IBOutlet UIButton *encryptWithPasswordBtn;
@property (weak, nonatomic) IBOutlet UIButton *encryptWithSymKeyBtn;
@property (weak, nonatomic) IBOutlet UIButton *decryptWithPasswordBtn;
@property (weak, nonatomic) IBOutlet UIButton *decryptWithSymKeyBtn;

@end

#endif /* SecureCellSealMode_h */
