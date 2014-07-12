//
// Created by Ladislav Lisy on 07.07.14.
// Copyright (c) 2014 ___HRAVEMZDY___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TermParty.h"


@interface TermOrder : TermParty<NSCopying>

@property (nonatomic, readonly) NSUInteger code;
@property (nonatomic, readonly) NSUInteger codeOrder;

-(id)initWithParty:(TermParty *)party andCode:(NSUInteger)code andCodeOrder:(NSUInteger)codeOrder;
-(id)initWithContractOrder:(NSUInteger)contractOrder andPositionOrder:(NSUInteger)positionOrder
                   andCode:(NSUInteger)code andCodeOrder:(NSUInteger)codeOrder;
+(id)termOrderWithParty:(TermParty *)party andCode:(NSUInteger)code andCodeOrder:(NSUInteger)codeOrder;
+(id)termOrderWithContractOrder:(NSUInteger)contractOrder andPositionOrder:(NSUInteger)positionOrder
                        andCode:(NSUInteger)code andCodeOrder:(NSUInteger)codeOrder;

-(BOOL)isEqualToOrder:(TermOrder *)party;
-(NSComparisonResult)compare:(TermOrder *)other;
-(BOOL)isEqual:other;
-(unsigned)hash;
@end