#import <Cedar/Cedar.h>
#import "Swedar-Swift.h"

// This file demonstrates that tests in both languages can co-exist in the same target
// and both be run by the same runner.

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *delegate;
    __block UIApplication *application;

    describe(@"application:didFinishLaunchingWithOptions:", ^{
        beforeEach(^{
            delegate = [[AppDelegate alloc] init];
            application = [UIApplication sharedApplication];
            [delegate application:application didFinishLaunchingWithOptions:nil];
        });

        it(@"displays a FooBarViewController", ^{
            expect(delegate.window.rootViewController).to(be_instance_of([UIViewController class]));
        });

        it(@"should make the window the key window", ^{
            expect(delegate.window.keyWindow).to(be_truthy);
        });
    });
});

SPEC_END
