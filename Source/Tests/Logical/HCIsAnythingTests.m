// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause

#import <OCHamcrest/HCIsAnything.h>

#import "MatcherTestCase.h"


@interface IsAnythingTests : MatcherTestCase
@end

@implementation IsAnythingTests

- (void)test_copesWithNilsAndUnknownTypes
{
    id matcher = anything();

    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)test_alwaysEvaluatesToTrue
{
    assertMatches(@"nil", anything(), nil);
    assertMatches(@"object", anything(), [[NSObject alloc] init]);
    assertMatches(@"string", anything(), @"hi");
}

- (void)test_hasUsefulDefaultDescription
{
    assertDescription(@"ANYTHING", anything());
}

- (void)test_canOverrideDescription
{
    NSString *description = @"DESCRIPTION";
    assertDescription(description, anythingWithDescription(description));
}

- (void)test_matchAlwaysSucceedsSoShouldNotGenerateMismatchDescription
{
    assertNoMismatchDescription(anything(), @"hi");
}

@end
