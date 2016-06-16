//
//  WLStringUrtils.h
//  mixgiPerson
//
//  Created by 王磊 on 16/3/16.
//  Copyright © 2016年 QHSY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WLStringUtils : NSObject

/*
    @param milli 毫秒值
    @param formate 日期格式 例：@"yyyy-MM-dd"
 
    将字符串形式的毫秒值转化为指定的格式的 字符串日期
 */
+ (NSString *) getStringFromMillisecond:(NSString *) milli andFormate:(NSString *) formate;


/*
    @param text 计算空间的文本
    @param maxSize 文本的最大长度和宽度
    @param font 文本的字体大小
    return 文本的尺寸大小
 
    根据文本内容获取文本占据的空间大小
 */
+ (CGSize) getStringSizeWith:(NSString *) text andMaxSize:(CGSize) maxSize andFont:(int) font;


/*
    @param str 传入的待检测文本
    return 是int返回yes 否则返回no
 
    检测一个字符串是否是整数
 */
+ (BOOL) checkStringIsInt:(NSString *) str;



/*
    @param str 传入的待检测文本
    return 是float 返回yes 否则返回no
 
    检测一个字符串是否是浮点数
 */
+ (BOOL) checkStringIsFloat:(NSString *) str;


/*
    @param str 传入的待检测文本
    return 是电话号码 返回yes 否则返回no
 
    检测一个字符串是否是电话号码
 */
+ (BOOL) checkStringIsTelephoneNumber:(NSString *) str;



/*
    @param str 传入的待检测文本
    return 是电话号码 返回yes 否则返回no
 
    检测一个字符串是否是身份证号码
 */
+ (BOOL) checkStringIsIdentityCardNumber:(NSString *) str;


/**/
/**/
/**/
/**/

/**/
/**/
/**/
/**/
/**/
/**/

/**/
/**/
/**/
/**/
/**/
/**/
@end
