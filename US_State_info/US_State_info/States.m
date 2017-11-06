
#import "States.h"

@implementation States
-(id)initWithName:(NSString *)name andWithCapital:(NSString*)capital andWithMotto:(NSString *)motto andWithBird:(NSString *)bird andWithPopulation:(NSString *)population andWithFlagImage:(UIImage *)flag andWithBirdImage:(UIImage *)birdImage
{
   self = [super init];
    if (self)
    {
        [self setName:name];
        [self setCapital:capital];
        [self setMotto:motto];
        [self setBird:bird];
        [self setPopulation:population];
        [self setFlagImage:flag];
        [self setBirdImage:birdImage];
    }
    return self;
}
@end
