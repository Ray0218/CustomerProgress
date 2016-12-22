//
//  DPProgressView.m
//  CustomerProgress
//
//  Created by Ray on 16/10/12.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "DPProgressView.h"

@interface DPProgressView (){

    CGFloat _WidPad ;
}
@property (nonatomic, strong) UIProgressView *rProgressView ;
@property (nonatomic, strong) NSMutableArray *rImgViewArray ;
@property (nonatomic, strong) NSTimer* rTimer ;




@end

@implementation DPProgressView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize] ;
    }
    return self;
}


- (void)initialize {
    _WidPad = 0 ;
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES ;
    self.layer.borderColor = [UIColor colorWithRed:0.89 green:0.60 blue:0.55 alpha:1.00].CGColor ;
    self.layer.borderWidth = 0.5 ;
    
    [self addSubview:self.rProgressView];
    
    self.rImgViewArray = [[NSMutableArray alloc]initWithCapacity:7];
    
    for (int i=0; i< 7; i++) {
        UIImageView *img = [[UIImageView alloc]init];
        img.image = [UIImage imageNamed:@"img_normal"] ;
        img.highlightedImage = [UIImage imageNamed:@"img_select"] ;
        img.backgroundColor = [UIColor clearColor] ;
        [self addSubview:img];
        [self.rImgViewArray addObject:img];
    }
    
}



-(void)layoutSubviews {
    
    self.layer.cornerRadius = CGRectGetHeight(self.frame)/2.0 ;
    
    
    CGFloat kImgWidth =  10 ; //火炬宽度
    CGFloat kImgHeigh =  15 ; //火炬宽度
    
    
    CGFloat kXpad = (CGRectGetWidth(self.rProgressView.frame)- 7*kImgWidth)/7.0 ; //火炬之间间距
    _WidPad = kXpad ;
    
    UIImageView *lastView ;
    for (int i=0; i<self.rImgViewArray.count; i++) {
        UIImageView * img = self.rImgViewArray[i] ;
        if (i == 0) {
            img.frame = CGRectMake(kXpad/2.0, (CGRectGetHeight(self.frame)-kImgHeigh)/2.0, kImgWidth, kImgHeigh) ;
        }else{
            img.frame = CGRectMake(CGRectGetMaxX(lastView.frame)+kXpad,  (CGRectGetHeight(self.frame)-kImgHeigh)/2.0, kImgWidth, kImgHeigh) ;
        }
        lastView = img ;
    }
}

//-(void)setRProgress:(CGFloat)rProgress {
//    _rProgress = rProgress  - _WidPad/(2.0*CGRectGetWidth(self.rProgressView.frame)) ;
//    
//    self.rTimer =  [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(pvt_refreshView) userInfo:nil repeats:YES];
//    
//}

// cur 当前积分  max 最大积分 min 最小积分 degres 当前等级

-(void)setCurValue:(CGFloat)curV maxValue:(CGFloat)max minValue:(CGFloat)min degree:(NSInteger)degres {

    
    _rProgress = ((curV- min)*_WidPad/(max-min))/CGRectGetWidth(self.rProgressView.frame) + degres/7.0  - _WidPad/(2.0*CGRectGetWidth(self.rProgressView.frame)) ;
    
    self.rTimer =  [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(pvt_refreshView) userInfo:nil repeats:YES];

}


-(void)pvt_refreshView {
    
    
    self.rProgressView.progress+= 0.01 ;
    if (self.rProgressView.progress >= self.rProgress) {
        
        [self.rTimer invalidate];
        
    }
    
    
    
    
    
    
    
    for (int i=0; i< 7; i++) {
        UIImageView *view = self.rImgViewArray[i] ;
        
        if (CGRectGetMaxX(view.frame) <= self.rProgressView.progress *CGRectGetWidth(self.rProgressView.frame)) {
            view.highlighted = YES ;
        }else{
            break ;
            
        }
    }
    
}

#pragma mark -getter

-(UIProgressView*)rProgressView {
    
    
    if (_rProgressView == nil) {
        
        _rProgressView = [[UIProgressView alloc]init];
        _rProgressView.progress = 0 ;
        _rProgressView.backgroundColor = [UIColor clearColor] ;
        
        
        
        UIImage *image = [self imageResize:[UIImage imageNamed:@"img_progress"] andResizeTo:CGSizeMake(2, 2)] ;
        
        _rProgressView.progressTintColor = [UIColor colorWithPatternImage: image]; ;

         _rProgressView.trackImage = nil ;
        _rProgressView.trackTintColor = [UIColor clearColor] ;
        _rProgressView.clipsToBounds = YES ;
        
        
        _rProgressView.frame = CGRectMake(0, (CGRectGetHeight(self.frame))/2-1, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) ;
        _rProgressView.transform = CGAffineTransformMakeScale(1.0f,(CGRectGetHeight(self.frame))/2.0 ) ;
        
        
    }
    
    
    return _rProgressView ;
}


-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
    CGFloat scale = [[UIScreen mainScreen]scale];
    
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end


@implementation DPCustomerView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize] ;
    }
    return self;
}


- (void)initialize {
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES ;
    self.layer.borderWidth = 0.5 ;
    self.layer.borderColor = [UIColor colorWithRed:0.74 green:0.61 blue:0.55 alpha:1.00].CGColor;
    
    self.image = [UIImage imageNamed:@"img_back"] ;
    
    [self addSubview:self.rCusProgressView];
    
    self.layer.cornerRadius = CGRectGetHeight(self.frame)/2.0 ;
    
}





-(DPProgressView*)rCusProgressView {
    if (_rCusProgressView == nil) {
        
        _rCusProgressView = [[DPProgressView alloc]initWithFrame:CGRectMake(3, 3, CGRectGetWidth(self.frame)-6, CGRectGetHeight(self.frame)-6)];
    }
    return _rCusProgressView ;
}


@end


