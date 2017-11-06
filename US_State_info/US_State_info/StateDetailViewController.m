
#import "StateDetailViewController.h"

@interface StateDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *stateFlagImage;
@property (weak, nonatomic) IBOutlet UILabel *detailStateMotto;
@property (weak, nonatomic) IBOutlet UILabel *stateDetailCapital;
@property (weak, nonatomic) IBOutlet UILabel *stateDetailPopulation;
@property (weak, nonatomic) IBOutlet UILabel *stateDetailBirdName;
@property (weak, nonatomic) IBOutlet UIImageView *stateBirdImage;


@end

@implementation StateDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *blueColor = [UIColor colorWithRed:.25 green:.62 blue:.96 alpha:1.0];
    UIColor *textBackgroundColor = [UIColor colorWithRed:.82 green:.92 blue:1.00 alpha:.8];
    self.view.backgroundColor = blueColor;
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    
    self.navigationItem.title = [self.myState getName];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.stateDetailCapital.text = self.myState.capital;
    self.stateFlagImage.image = self.myState.flag;
    self.detailStateMotto.text = self.myState.motto;
    self.stateDetailPopulation.text = self.myState.population;
    self.stateDetailBirdName.text = self.myState.bird;
    self.stateBirdImage.image= self.myState.birdImage;
    
    self.stateDetailCapital.backgroundColor = textBackgroundColor;
    self.detailStateMotto.backgroundColor = textBackgroundColor;
    self.stateDetailPopulation.backgroundColor = textBackgroundColor;
    self.stateDetailBirdName.backgroundColor = textBackgroundColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
