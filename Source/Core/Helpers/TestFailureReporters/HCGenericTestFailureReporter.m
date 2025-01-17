// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import "HCGenericTestFailureReporter.h"

#import "HCTestFailure.h"


@implementation HCGenericTestFailureReporter

- (BOOL)willHandleFailure:(HCTestFailure *)failure
{
    return YES;
}

- (void)executeHandlingOfFailure:(HCTestFailure *)failure
{
    NSException *exception = [self createExceptionForFailure:failure];
    [exception raise];
}

- (NSException *)createExceptionForFailure:(HCTestFailure *)failure
{
    NSString *failureReason = [NSString stringWithFormat:@"%@:%lu: matcher error: %@",
                                                         failure.fileName,
                                                         (unsigned long)failure.lineNumber,
                                                         failure.reason];
    return [NSException exceptionWithName:@"HCGenericTestFailure" reason:failureReason userInfo:nil];
}

@end
