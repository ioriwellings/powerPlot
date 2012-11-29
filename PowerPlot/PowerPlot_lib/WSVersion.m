///
///  @file
///  WSVersion.m
///  PowerPlot
///
///  Created by Wolfram Schroers on 03/15/10.
///  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
///

#import "WSVersion.h"


@implementation WSVersion

@synthesize packageName = _packageName;
@synthesize developerName = _developerName;
@synthesize licenseStyle = _licenseStyle;
@synthesize packageVersion = _packageVersion;
@synthesize requiredVersion = _requiredVersion;
@synthesize classVersion = _classVersion;


- (id)init {
    self = [super init];
    if (self) {
        NSParameterAssert(kPackageVersion > 0.0);
        NSParameterAssert(kClassVersion > 0.0);
        _packageName = kPackageName;
        _developerName = kDeveloperName;
        _licenseStyle = kLicenseStyle;
        _packageVersion = kPackageVersion;
        _classVersion = kClassVersion;
    }
    if ([self conflictingVersion]) {
        // Raise the exception, override and modify to also enter information.
        NSException *conflict = [NSException
                                 exceptionWithName:[NSString
                                                    stringWithFormat:@"DEVELOPER ERROR <%@>",
                                                    [self class]]
                                                    reason:@"Version conflict"
                                                    userInfo:nil];
        @throw conflict;
    }
    return self;
}


#pragma mark - Version matching verification

- (BOOL)conflictingVersion {
    // Paste your own code with the appropriate conventions regarding your software.
    return NO;
}


#pragma mark -

- (NSString *)version {
    return [NSString stringWithFormat:@"<%@> (version %f) in package <%@> "
                @"(version %f), developed by <%@>. RELEASEVERSION",
            [self class],
            [self classVersion],
            [self packageName],
            [self packageVersion],
            [self developerName]];
}

+ (NSString *)UIIDForInstance:(id)obj {
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef uuidStr = CFUUIDCreateString(kCFAllocatorDefault, uuid);
    NSString *result = [NSString stringWithFormat:@"%@-%p-%@",
                        [obj class],
                        (void *)obj,
                        (NSString *)uuidStr];
    CFRelease(uuidStr);
    CFRelease(uuid);
    
    return result;
}

- (void)dealloc {
    [_packageName release];
    [_developerName release];
    _packageName = nil;
    _developerName = nil;
    [super dealloc];
}

@end
