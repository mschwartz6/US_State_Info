
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>  // need for UIImage

@interface States : NSObject
@property (strong, nonatomic,getter=getName,setter=setName:) NSString* name;
@property (strong, nonatomic,getter=getCapital,setter=setCapital:) NSString* capital;
@property (strong, nonatomic,getter=getMotto,setter=setMotto:) NSString* motto;
@property (strong, nonatomic,getter=getBird,setter=setBird:) NSString* bird;
@property (strong, nonatomic,getter=getPopulation,setter=setPopulation:) NSString* population;
@property (strong, nonatomic,getter=getFlagImage,setter=setFlagImage:) UIImage* flag;
@property (strong, nonatomic,getter=getBirdImage,setter=setBirdImage:) UIImage* birdImage;
-(id)initWithName:(NSString *)name andWithCapital:(NSString*)capital andWithMotto:(NSString *)motto andWithBird:(NSString *)bird andWithPopulation:(NSString *)population andWithFlagImage:(UIImage *)flag andWithBirdImage:(UIImage *)birdImage;
@end
