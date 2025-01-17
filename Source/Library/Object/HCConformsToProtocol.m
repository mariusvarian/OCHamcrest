// OCHamcrest by Jon Reid, https://qualitycoding.org
// Copyright 2022 hamcrest.org. https://github.com/hamcrest/OCHamcrest/blob/main/LICENSE.txt
// SPDX-License-Identifier: BSD-2-Clause
// Contribution by Todd Farrell

#import "HCConformsToProtocol.h"

#import "HCRequireNonNilObject.h"


@interface HCConformsToProtocol ()
@property (nonatomic, strong, readonly) Protocol *protocol;
@end

@implementation HCConformsToProtocol

- (instancetype)initWithProtocol:(Protocol *)protocol
{
    HCRequireNonNilObject(protocol);

    self = [super init];
    if (self)
        _protocol = protocol;
    return self;
}

- (BOOL)matches:(nullable id)item
{
    return [item conformsToProtocol:self.protocol];
}

- (void)describeTo:(id <HCDescription>)description
{
    [[description appendText:@"an object that conforms to "]
                  appendText:NSStringFromProtocol(self.protocol)];
}

@end


id HC_conformsTo(Protocol *aProtocol)
{
    return [[HCConformsToProtocol alloc] initWithProtocol:aProtocol];
}
