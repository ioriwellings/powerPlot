///
///  WSVersion.h
///  PowerPlot
///
///  Generic versioning and identification mechanism whose
///  implementation and use is optional for derived objects.
///
///
///  Created by Wolfram Schroers on 03/15/10.
///  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
///

#import <Foundation/Foundation.h>
#import "WSAuxiliary.h"


/** Name of this package. */
#define kPackageName @"PowerPlot"

/** Name of developer. */
#define kDeveloperName @"Dr. Wolfram Schroers, NuAS, Berlin, Germany"

/** License conditions of this version. */
#define kLicenseStyle @"GPLv3"

/** Current package version number. */
#define kPackageVersion 1.43

/** Version of the current class. */
#define kClassVersion 1.43

/** Unique commit ID (force SVN to always update info in this file on
    each commit). This requires a custom script which wraps the
    commit-command. */
#define kCommitID @"@COMMIT_ID@"

@interface WSVersion : NSObject

@property (readonly) NSString *packageName;   ///< Name of package.
@property (readonly) NSString *developerName; ///< Name of developer/software house.
@property (readonly) NSString *licenseStyle;  ///< License condition of the current class.
@property (readonly) CGFloat packageVersion;  ///< Version tag for the entire package.
@property (readonly) CGFloat requiredVersion; ///< Required version number for current class.
@property (readonly) CGFloat classVersion;    ///< Actual version number of current class.

/** @brief Return if this object satisfies version requirements.
 
    You should overwrite this method with your own implementation if
    you want the versioning mechanism to detect incompatibilities.

    @return YES in case of a version conflict, NO otherwise.
 */
- (BOOL)conflictingVersion;

/** Return version information and internal revision info (debug).

    With the debug flag activitated, the version information is
    significantly more verbose and contains the SVN magic
    keywords. These should not be used in release versions.

    @return  An NSString with version information.
 */
- (NSString *)version;

/** @brief Return a unique instance identifier (UIID) for an instance.
 
    The UIID is a unique string for the run of the program on a single
    machine.
 
    @note This method must only be called once for each instance!
 */
+ (NSString *)UIIDForInstance:(id)obj;

@end
