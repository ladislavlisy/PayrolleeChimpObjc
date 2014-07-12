//
// Created by Ladislav Lisy on 07.07.14.
// Copyright (c) 2014 ___HRAVEMZDY___. All rights reserved.
//

#import "TermOrder.h"


@implementation TermOrder {

}

@synthesize code = _code;
@synthesize codeOrder = _codeOrder;

-(id)initWithParty:(TermParty *)party andCode:(NSUInteger)code andCodeOrder:(NSUInteger)codeOrder {
    return [self initWithContractOrder:[party contractOrder] andPositionOrder:[party positionOrder] andCode:code andCodeOrder:codeOrder];
}
-(id)initWithContractOrder:(NSUInteger)contractOrder andPositionOrder:(NSUInteger)positionOrder
                   andCode:(NSUInteger)code andCodeOrder:(NSUInteger)codeOrder {
    if (!(self=[super initWithContractOrder:contractOrder andPositionOrder:positionOrder])) return nil;
    _code = code;
    _codeOrder = codeOrder;
    return self;
}

+(id)termOrderWithParty:(TermParty *)party andCode:(NSUInteger)code andCodeOrder:(NSUInteger)codeOrder {
    return [[self alloc] initWithParty:party andCode:code andCodeOrder:codeOrder];
}

+(id)termOrderWithContractOrder:(NSUInteger)contractOrder andPositionOrder:(NSUInteger)positionOrder
                        andCode:(NSUInteger)code andCodeOrder:(NSUInteger)codeOrder {
    return [[self alloc] initWithContractOrder:contractOrder andPositionOrder:positionOrder
                                       andCode:code andCodeOrder:codeOrder];
}

-(id)copyWithZone:(NSZone*) zone {
    id copiedTermOrder = [[[self class] allocWithZone:zone]
            termOrderWithContractOrder:[self contractOrder] andPositionOrder:[self positionOrder]
                               andCode:[self code] andCodeOrder:[self codeOrder]];
    return copiedTermOrder;
}

-(BOOL)isEqualToOrder:(TermOrder *)other {
    TermParty * otherParty = (TermParty *)other;
    if ([self isEqualToParty:otherParty])
    {
        if (_code == other.code && _codeOrder == other.codeOrder)
        {
            return YES;
        }
    }
    return NO;
}

-(NSComparisonResult)compare:(TermOrder *)other {
    TermParty * otherParty = (TermParty *)other;
    if ([self isEqualToParty:otherParty])
    {
        return [super compare:otherParty];
    }
    if (_code != other.codeOrder)
    {
        return [[self class] compareInt:_code AndOtherInt:other.code];
    }
    else if (_codeOrder != other.codeOrder)
    {
        return [[self class] compareInt:_codeOrder AndOtherInt:other.codeOrder];
    }
    return NSOrderedSame;

}

-(BOOL)isEqual:(id) other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToOrder:other];
}

-(unsigned)hash {
    NSUInteger prime = 31;
    NSUInteger result = [super hash];

    result += prime * result + _code;
    result += prime * result + _codeOrder;
    return result;
}
@end