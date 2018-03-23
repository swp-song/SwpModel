//
//  ViewController.m
//  SwpModelDemo
//
//  Created by swp_song on 2018/3/15.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "ViewController.h"


#import <SwpModel/SwpModelHeader.h>

#import "TestModel.h"
#import "Test1Model.h"
#import "Test2Model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestModel *test     = [TestModel testInit];
    TestModel *testTemp1 = [test swpUnArchive];
    
    NSData    *testData2 = [NSKeyedArchiver archivedDataWithRootObject:test];
    TestModel *testTemp2 = [NSKeyedUnarchiver unarchiveObjectWithData:testData2];
    
    NSLog(@"%@", testTemp1);
    NSLog(@"%@", testTemp2);
    
    Test1Model *test1    = [Test1Model test1Init];
    TestModel *test1Temp = [test1 swpUnArchive];
    NSLog(@"%@", test1);
    NSLog(@"%@", test1Temp);
    
    Test2Model *test2       = [Test2Model test2Init];
    Test2Model *test2Temp   = [test2 swpUnArchive];
    NSLog(@"%@", test2);
    NSLog(@"%@", test2Temp);
    
    NSLog(@"test2Temp[testNSString]  = %@", test2Temp.testNSString);
    NSLog(@"test2Temp[test1NSString] = %@", test2Temp.test1NSString);
    NSLog(@"test2Temp[test2NSString] = %@", test2Temp.test2NSString);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
