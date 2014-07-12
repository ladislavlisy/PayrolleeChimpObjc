//
// Created by Ladislav Lisy on 07.07.14.
// Copyright (c) 2014 ___HRAVEMZDY___. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TermParty : NSObject <NSCopying>

@property (nonatomic, readonly) NSUInteger contractOrder;
@property (nonatomic, readonly) NSUInteger positionOrder;

-(id)initWithContractOrder:(NSUInteger)contractOrder andPositionOrder:(NSUInteger)positionOrder;
+(id)termOrderContractOrder:(NSUInteger)contractOrder andPositionOrder:(NSUInteger)positionOrder;

+(NSComparisonResult)compareInt:(NSUInteger)selfProp AndOtherInt:(NSUInteger)otherProp;
-(BOOL)isEqualToParty:(TermParty *)party;
-(NSComparisonResult)compare:(TermParty *)other;
-(BOOL)isEqual:other;
-(unsigned)hash;

@end