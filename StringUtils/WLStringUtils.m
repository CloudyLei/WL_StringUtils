//
//  WLStringUrtils.m
//  mixgiPerson
//
//  Created by 王磊 on 16/3/16.
//  Copyright © 2016年 QHSY. All rights reserved.
//

#import "WLStringUtils.h"

@implementation WLStringUtils

//将毫秒转换成指定格式的日期
+ (NSString *)getStringFromMillisecond:(NSString *)milli andFormate:(NSString *)formate{

    //除去 milli 的前后空格
    milli=[milli stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if([milli isEqualToString:@""]){
    
        return @"";
    }

    if(formate ==nil || [formate isEqualToString:@""]){
    
        formate=@"yyyy-MM-dd";
    }
    
    //获取date 对象
    NSDate *date=[[NSDate alloc] initWithTimeIntervalSince1970:[milli longLongValue]/1000];
    
    //创建格式化对象
    NSDateFormatter *matter=[[NSDateFormatter alloc] init];
    matter.dateFormat=formate;
    
    return [matter stringFromDate:date];
}


// 根据文本内容计算文本的空间大小
+ (CGSize)getStringSizeWith:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(int)font{

    if(text==nil || [text isEqualToString:@""]){
    
        return CGSizeZero;
    }
    
    if(CGSizeEqualToSize(maxSize, CGSizeZero)){
    
        return CGSizeZero;
    }
    
    if(font==0){
    
        font=14;
    }
    
    UIFont *cuFont=[UIFont systemFontOfSize:font];
    
     // 构建字典
    NSDictionary *attr=[NSDictionary dictionaryWithObjectsAndKeys:cuFont,NSFontAttributeName, nil];
    
   return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    
}


//判断一个字符串是否是整数
+ (BOOL)checkStringIsInt:(NSString *)str{

    if(str==nil || [str isEqualToString:@""]){
    
        return NO;
    }
    
    NSScanner *scan=[NSScanner scannerWithString:str];
    int val;

    return [scan scanInt:&val] && [scan isAtEnd];
}


//判断一个字符串是否是浮点数
+ (BOOL)checkStringIsFloat:(NSString *)str{

    if(str==nil || [str isEqualToString:@""]){
    
        return NO;
    }
    
    NSScanner *scan=[NSScanner scannerWithString:str];

    float val;
    
    return [scan scanFloat:&val] && [scan isAtEnd];
}


//验证字符串是否是电话号码
+ (BOOL)checkStringIsTelephoneNumber:(NSString *)str{

    //除去前后空格
    str=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if(str==nil || [str isEqualToString:@""]){
        
        return NO;
    }
    
    NSString *regular=@"^1[358]\\d{9}$";
    
    NSPredicate *cate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regular];

    return [cate evaluateWithObject:str];
}


//验证字符串是否是身份证号
+ (BOOL)checkStringIsIdentityCardNumber:(NSString *)str{

    //除去前后空格
    str=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if(str==nil || [str isEqualToString:@""]){
        
        return NO;
    }

    NSString *regular=@"^([1-9]\\d{14})|([1-9]\\d{16}[\\d|X|x])$";
    
    NSPredicate *cate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regular];
    
    return [cate evaluateWithObject:str];
}

@end
