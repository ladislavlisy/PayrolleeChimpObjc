//
//  TermPartyEqualityTest.m
//  TermPartyEqualityTest
//
//  Created by Ladislav Lisy on 07.07.14.
//  Copyright (c) 2014 ___HRAVEMZDY___. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TermParty.h"

@interface TermPartyEqualityTest : XCTestCase

@property (nonatomic, readwrite) TermParty * partyOne;
@property (nonatomic, readwrite) TermParty * partyTwo;

@end

@implementation TermPartyEqualityTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSUInteger contractOne = 1;
    NSUInteger contractTwo = 1;
    NSUInteger positionOne = 1;
    NSUInteger positionTwo = 1;

    _partyOne = [[TermParty alloc] initWithContractOrder:contractOne andPositionOrder:positionOne];
    _partyTwo = [[TermParty alloc] initWithContractOrder:contractTwo andPositionOrder:positionTwo];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShould_Equal_TwoInstances_With_Same_ContractOrder_And_PositionOrder
{
    XCTAssertEqualObjects(_partyOne, _partyTwo);
}

@end
