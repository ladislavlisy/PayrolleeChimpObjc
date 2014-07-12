//
//  TermOrderEqualityTest.m
//  TermOrderEqualityTest
//
//  Created by Ladislav Lisy on 07.07.14.
//  Copyright (c) 2014 ___HRAVEMZDY___. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TermParty.h"
#import "ArticleCode.h"
#import "TermOrder.h"

@interface TermOrderCompareCodeTest : XCTestCase

@property (nonatomic, readwrite) TermOrder * orderOne;
@property (nonatomic, readwrite) TermOrder * orderTwo;

@end

@implementation TermOrderCompareCodeTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSUInteger contractOne = 1;
    NSUInteger contractTwo = 1;
    NSUInteger positionOne = 1;
    NSUInteger positionTwo = 1;

    TermParty * _partyOne = [[TermParty alloc] initWithContractOrder:contractOne andPositionOrder:positionOne];
    TermParty * _partyTwo = [[TermParty alloc] initWithContractOrder:contractTwo andPositionOrder:positionTwo];

    NSUInteger codeOne = ARTICLE_EMPLOYMENT_TERM;
    NSUInteger codeTwo = ARTICLE_EMPLOYMENT_TERM;
    NSUInteger codeOrderOne = 1;
    NSUInteger codeOrderTwo = 1;

    _orderOne = [[TermOrder alloc] initWithParty:_partyOne andCode:codeOne andCodeOrder:codeOrderOne];
    _orderTwo = [[TermOrder alloc] initWithParty:_partyTwo andCode:codeTwo andCodeOrder:codeOrderTwo];

}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShould_Compare_TwoInstancesWith_Different_Code_And_Same_CodeOrder_AsGreater
{
    XCTAssertTrue([_orderTwo compare:_orderOne]==NSOrderedDescending);
}

- (void)testShould_Compare_TwoInstancesWith_Different_Code_And_Same_CodeOrder_AsLess
{
    XCTAssertTrue([_orderOne compare:_orderTwo]==NSOrderedAscending);
}

@end
