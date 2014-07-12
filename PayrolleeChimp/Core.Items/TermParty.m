//
// Created by Ladislav Lisy on 07.07.14.
// Copyright (c) 2014 ___HRAVEMZDY___. All rights reserved.
//

#import "TermParty.h"


@implementation TermParty {

}

@synthesize contractOrder = _contractOrder;
@synthesize positionOrder = _positionOrder;

- (id)initWithContractOrder:(NSUInteger)contractOrder andPositionOrder:(NSUInteger)positionOrder {
    if (!(self=[super init])) return nil;
    _contractOrder = contractOrder;
    _positionOrder = positionOrder;
    return self;
}

+ (id)termOrderContractOrder:(NSUInteger)contractOrder andPositionOrder:(NSUInteger)positionOrder {
    return [[self alloc] initWithContractOrder:contractOrder andPositionOrder:positionOrder];
}


- (id)copyWithZone:(NSZone*) zone {
    id copiedTermParty = [[[self class] allocWithZone:zone] termOrderContractOrder:[self contractOrder] andPositionOrder:[self positionOrder]];
    return copiedTermParty;
}

- (NSComparisonResult)compare:(TermParty*)other {
    if (_contractOrder != other.contractOrder)
    {
        return [[self class] compareInt:_contractOrder AndOtherInt:other.contractOrder];
    }
    else if (_positionOrder != other.positionOrder)
    {
        return [[self class] compareInt:_positionOrder AndOtherInt:other.positionOrder];
    }
    return NSOrderedSame;
}

+ (NSComparisonResult)compareInt:(NSUInteger)selfProp AndOtherInt:(NSUInteger)otherProp {
    return ((selfProp < otherProp) ? NSOrderedAscending : ((selfProp > otherProp) ? NSOrderedDescending : NSOrderedSame));
}

- (BOOL)isEqualToParty:(TermParty*)other {
    if (_contractOrder == other.contractOrder && _positionOrder == other.positionOrder)
    {
        return YES;
    }
    return NO;
}

- (BOOL)isEqual:(id) other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToParty:other];
}

- (unsigned int)hash {
    NSUInteger prime = 31;
    NSUInteger result = 1;


    result += prime * result + _contractOrder;
    result += prime * result + _positionOrder;
    return result;
}

@end