//
//  NotMainThreadFix.m
//  NotMainThreadFix
//
//  Created by Siarhei Ladzeika on 11/1/20.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@implementation UIApplication(NotMainThreadFix)

+ (UIApplication *)NotMainThreadFix_sharedApplication {
    if ([NSThread isMainThread]) {
        return [self NotMainThreadFix_sharedApplication];
    }
    else {
        __block UIApplication* application = nil;
        dispatch_sync(dispatch_get_main_queue(), ^{
            application = [self NotMainThreadFix_sharedApplication];
        });
        return application;
    }
}

- (UIApplicationState)NotMainThreadFix_applicationState {
    if ([NSThread isMainThread]) {
        return [self NotMainThreadFix_applicationState];
    }
    else {
        __block UIApplicationState applicationState = UIApplicationStateActive;
        dispatch_sync(dispatch_get_main_queue(), ^{
            applicationState = [self NotMainThreadFix_applicationState];
        });
        return applicationState;
    }
}

- (id<UIApplicationDelegate>)NotMainThreadFix_delegate {
    if ([NSThread isMainThread]) {
        return [self NotMainThreadFix_delegate];
    }
    else {
        __block id<UIApplicationDelegate> delegate = nil;
        dispatch_sync(dispatch_get_main_queue(), ^{
            delegate = [self NotMainThreadFix_delegate];
        });
        return delegate;
    }
}

@end

__attribute__ ((visibility ("hidden")))
static void swizzleClassMethod(Class target, SEL origSelector, SEL newSelector) {
    Method originalMethod = class_getClassMethod(target, origSelector);
    Method extendedMethod = class_getClassMethod(target, newSelector);
    method_exchangeImplementations(originalMethod, extendedMethod);
}

__attribute__ ((visibility ("hidden")))
static void swizzleInstanceMethod(Class target, SEL origSelector, SEL newSelector) {
    Method originalMethod = class_getInstanceMethod(target, origSelector);
    Method extendedMethod = class_getInstanceMethod(target, newSelector);
    method_exchangeImplementations(originalMethod, extendedMethod);
}

@implementation NSObject(NotMainThreadFix)

+ (void)load {

    static dispatch_once_t once_token;

    dispatch_once(&once_token,  ^{
        swizzleClassMethod([UIApplication class], @selector(sharedApplication), @selector(NotMainThreadFix_sharedApplication));
        swizzleInstanceMethod([UIApplication class], @selector(applicationState), @selector(NotMainThreadFix_applicationState));
        swizzleInstanceMethod([UIApplication class], @selector(delegate), @selector(NotMainThreadFix_delegate));
    });

}

@end
