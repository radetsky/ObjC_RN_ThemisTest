//
//  ObjC_RN_ThemisTestUITestsLaunchTests.m
//  ObjC_RN_ThemisTestUITests
//
//  Created by Oleksii Radetskyi on 01.12.2021.
//

#import <XCTest/XCTest.h>

@interface ObjC_RN_ThemisTestUITestsLaunchTests : XCTestCase

@end

@implementation ObjC_RN_ThemisTestUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
