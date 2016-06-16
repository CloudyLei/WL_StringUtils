//
//  ViewController.m
//  StringUtils
//
//  Created by 王磊 on 16/3/17.
//  Copyright © 2016年 王磊. All rights reserved.
//

#import "ViewController.h"
#import "WLStringUtils.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str=@"15220633806";
    
    BOOL isPhone=[WLStringUtils checkStringIsTelephoneNumber:str];
    
    NSLog(@"%d",isPhone);
    
    
    str=@"321324198907210612";
    
    BOOL isCard=[WLStringUtils checkStringIsIdentityCardNumber:str];
    
    
    str=@"123.56";
    isCard=[WLStringUtils checkStringIsFloat:str];
    
    
    BOOL isInt=[WLStringUtils checkStringIsInt:str];
    
    NSLog(@"%d",isInt);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
