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
+ (NSString *)getStringFromMillisecond:(NSString *)milli withFormate:(NSString *)formate{

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
    NSDictionary *attr=[NSDictionary dictionaryWithObjectsAndKeys:NSFontAttributeName,cuFont, nil];
    
   return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    
}


//根据文本内容和文本属性字典获取文本的空间大小
+ (CGSize) getStringSizeWith:(NSString *)text andTextAttributes:(NSDictionary *)attr{

    if(text==nil || [text isEqualToString:@""]){
        
        return CGSizeZero;
    }

    return [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesDeviceMetrics | NSStringDrawingTruncatesLastVisibleLine attributes:attr context:nil].size;
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

//验证字符串是否是 IP 地址
+ (BOOL)isValidatIP:(NSString *)ipAddress {
    
    NSString  *urlRegEx =@"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:urlRegEx options:0 error:&error];
    
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:ipAddress options:0 range:NSMakeRange(0, [ipAddress length])];
        
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            NSString *result=[ipAddress substringWithRange:resultRange];
            //输出结果
            NSLog(@"%@",result);
            return YES;
        }
    }
    
    return NO;
}


@end
