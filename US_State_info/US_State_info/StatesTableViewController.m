
#import "StatesTableViewController.h"

@interface StatesTableViewController ()
@property (strong, nonatomic) NSMutableArray* usStates;
@property (nonatomic, strong)NSArray *USstatesnames;
@property (nonatomic, strong)NSArray *UScapitals;
@property (nonatomic, strong)NSArray *stateMotto;
@property (nonatomic, strong)NSArray *birdName;
@property (nonatomic, strong)NSArray *population;
@property (nonatomic, strong)NSMutableArray *colors;
@end

@implementation StatesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateArraysWithStateInfo];
    UIColor *redColor = [UIColor colorWithRed:.96 green:.25 blue:.31 alpha:1.0];
    UIColor *blueColor = [UIColor colorWithRed:.25 green:.62 blue:.96 alpha:1.0];
    UIColor *whiteColor = [UIColor whiteColor];
    self.colors = [NSMutableArray arrayWithObjects:redColor,blueColor,whiteColor, nil];
    
   
    self.navigationController.navigationBar.prefersLargeTitles = YES ;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
   
    self.navigationItem.title = @"All 50 States";
  
    int stateCount = (int)self.USstatesnames.count;
    States *stateInfo[stateCount];
   
    for (int i = 0 ;i < stateCount; i++)
    {
        NSString *lowercaseStateName = [[self.USstatesnames objectAtIndex:i] lowercaseString];
        
        NSString *flagImageFile = [NSString stringWithFormat:@"Flags/Small/%@-flag-small",lowercaseStateName];
        NSString *birdImageFile = [NSString stringWithFormat:@"birds/%@-bird-thumb.jpg",lowercaseStateName];
        
        NSString *name = [NSString stringWithString:self.USstatesnames[i]];
        NSString *capital = [NSString stringWithString: self.UScapitals[i]];
        NSString *motto = [NSString stringWithString:self.stateMotto[i]];
        NSString *bird =[NSString stringWithString:self.birdName[i]];
        NSString *population = [NSString stringWithString:self.population[i]];
        UIImage *flagImage = [UIImage imageNamed:flagImageFile];
        UIImage *birdImage = [UIImage imageNamed:birdImageFile];
        
        States *aState = [[States alloc]initWithName:name
                                 andWithCapital:capital
                                 andWithMotto:motto
                                 andWithBird:bird
                                 andWithPopulation:population
                                 andWithFlagImage:flagImage
                                 andWithBirdImage:birdImage
                          ];
       stateInfo[i] = aState;
        
     }
    
    self.usStates = [NSMutableArray arrayWithObjects:stateInfo count:stateCount];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.prefersLargeTitles  = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.USstatesnames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"stateInfoCellId";
    StateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // populate the cell with data
  
    States *aState = [self.usStates objectAtIndex:indexPath.row];
    cell.stateName.text =[aState getName];
    cell.stateMoto.text = [aState getMotto];
    cell.flagImageView.image = [aState getFlagImage];
    cell.stateName.font = [UIFont boldSystemFontOfSize:32];
    cell.stateMoto.font = [UIFont italicSystemFontOfSize:16];
    
    if (indexPath.row == 0 || indexPath.row % 3 == 0)
        cell.backgroundColor = [_colors objectAtIndex:0];
    else if ((indexPath.row % 3) - 1 == 0)
        cell.backgroundColor = [_colors objectAtIndex:2];
    else
        cell.backgroundColor = [_colors objectAtIndex:1];
    
    UIView *backView = [[UIView alloc]initWithFrame:cell.frame];
    backView.backgroundColor = [UIColor yellowColor];
    cell.selectedBackgroundView = backView;
    
    return cell;
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    if ([[segue identifier] isEqualToString:@"showDetails"]){
        StateDetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        States* item = [self.usStates objectAtIndex:myIndexPath.row];
    
        detailVC.myState = item;
    }
    
}
-(void)populateArraysWithStateInfo {
    self.USstatesnames = @[@"Alabama",@"Alaska",@"Arizona",@"Arkansas",@"California",@"Colorado",@"Connecticut",@"Delaware",@"Florida",@"Georgia",@"Hawaii",@"Idaho",@"Illinois",@"Indiana",@"Iowa",@"Kansas",@"Kentucky",@"Louisiana",@"Maine",@"Maryland",@"Massachusetts",@"Michigan",@"Minnesota",@"Mississippi",@"Missouri",@"Montana", @"Nebraska",@"Nevada",@"New-Hampshire",@"New-Jersey",@"New-Mexico",@"New-York",@"North-Carolina",@"North-Dakota",@"Ohio",@"Oklahoma",@"Oregon",@"Pennsylvania", @"Rhode-Island",@"South-Carolina",@"South-Dakota",@"Tennessee",@"Texas",@"Utah",@"Vermont",@"Virginia",@"Washington",@"West-Virginia",@"Wisconsin",@"Wyoming"];
    
    self.population = @[@"4,884,115",
                        @"741,204  ",
                        @"7,026,629  ",
                        @"3,000,942  ",
                        @"39,849,872  ",
                        @"5,658,546  ",
                        @"3,583,134  ",
                        @"965,866  ",
                        @"21,002,678  ",
                        @"10,450,316  ",
                        @"1,454,295  ",
                        @"1,695,178  ",
                        @"12,815,607  ",
                        @"6,663,280  ",
                        @"3,152,735  ",
                        @"2,929,909  ",
                        @"4,450,042  ",
                        @"4,714,192  ",
                        @"1,327,472  ",
                        @"6,068,511  ",
                        @"6,873,018  ",
                        @"9,935,116  ",
                        @"5,554,532  ",
                        @"2,990,113  ",
                        @"6,123,362  ",
                        @"1,052,343  ",
                        @"1,922,610  ",
                        @"2,995,973  ",
                        @"1,335,832  ",
                        @"8,996,351  ",
                        @"2,084,193  ",
                        @"19,889,657  ",
                        @"10,247,632  ",
                        @"790,701  ",
                        @"11,646,273  ",
                        @"3,974,794  ",
                        @"4,144,527  ",
                        @"12,819,975  ",
                        @"1,059,080  ",
                        @"5,030,118  ",
                        @"868,799  ",
                        @"6,705,339  ",
                        @"28,449,186  ",
                        @"3,098,761  ",
                        @"624,592  ",
                        @"8,492,783  ",
                        @"7,384,721  ",
                        @"1,834,882  ",
                        @"5,795,147  ",
                        @"589,713" ,
                        ];
    
    self.UScapitals = @[@"Montgomery",
                        @"Juneau",
                        @"Phoenix",
                        @"Little Rock",
                        @"Sacramento",
                        @"Denver",
                        @"Hartford",
                        @"Dover",
                        @"Tallahassee",
                        @"Atlanta",
                        @"Honolulu",
                        @"Boise",
                        @"Springfield",
                        @"Indianapolis",
                        @"Des Moines",
                        @"Topeka",
                        @"Frankfort",
                        @"Baton Rouge",
                        @"Augusta",
                        @"Annapolis",
                        @"Boston",
                        @"Lansing",
                        @"St. Paul",
                        @"Jackson",
                        @"Jefferson City",
                        @"Helena",
                        @"Lincoln",
                        @"Carson City",
                        @"Concord",
                        @"Trenton",
                        @"Santa Fe",
                        @"Albany",
                        @"Raleigh",
                        @"Bismarck",
                        @"Columbus",
                        @"Oklahoma City",
                        @"Salem",
                        @"Harrisburg",
                        @"Providence",
                        @"Columbia",
                        @"Pierre",
                        @"Nashville",
                        @"Austin",
                        @"Salt Lake City",
                        @"Montpelier",
                        @"Richmond",
                        @"Olympia",
                        @"Charleston",
                        @"Madison",
                        @"Cheyenne"];
    
    
    self.stateMotto = @[@"We Dare Maintain Our Rights",
                        @"North to the Future",
                        @"God enriches",
                        @"The people rule", @"I have found it", @"Nothing without providence", @"He who transplanted still sustains", @"Liberty and independence", @"In God we trust", @"Wisdom, Justice, and Moderation", @"The life of the land is perpetuated\nin righteousness", @"It is perpetual", @"State sovereignty, national union", @"The crossroads of America", @"Our liberties we prize \nand our rights we will maintain", @"To the stars through difficulties", @"Let Us Be Grateful to God", @"Union, justice and confidence", @"I direct", @"Manly deeds, womanly words", @"By the sword we seek peace,\nbut peace only under liberty", @"If you seek a pleasant peninsula,\nlook about you", @"The star of the north", @"By valor and arms", @"The welfare of the people\nshall be the supreme law", @"Gold and Silver", @"Equality before the law", @"All for our country", @"Live free or die", @"Liberty and Prosperity", @"It grows as it goes", @"Ever Upward!", @"To be, rather than to seem", @"Liberty and union,\nnow and forever, one and inseparable", @"With God, all things are possible", @"Labor conquers all things", @"She flies with her own wings", @"Virtue, liberty and independence", @"Hope", @"While I breathe, I hope", @"Under God, the people rule", @"Agriculture and commerce", @"Friendship", @"Industry", @"May the 14th star shine bright", @"Thus always to tyrants", @"By and by", @"Mountaineers always free", @"Forward", @"Equal rights"
                        ];
    
    self.birdName = @[
                      @"Yellowhammer",
                      @"Willow Ptarmigan",
                      @"Cactus Wren",
                      @"Mockingbird",
                      @"California Valley Quail",
                      @"Lark Bunting",
                      @"Robin",
                      @"Blue Hen Chicken",
                      @"Mockingbird",
                      @"Brown Thrasher",
                      @"Nene",
                      @"Mountain Bluebird",
                      @"Cardinal",
                      @"Cardinal",
                      @"Eastern Goldfinch",
                      @"Western Meadowlark",
                      @"Cardinal",
                      @"Eastern Brown Pelican",
                      @"Chickadee",
                      @"Baltimore Oriole",
                      @"Chickadee",
                      @"Robin",
                      @"Common Loon",
                      @"Mockingbird",
                      @"Bluebird",
                      @"Western Meadowlark",
                      @"Western Meadowlark",
                      @"Mountain Bluebird",
                      @"Purple Finch",
                      @"Eastern Goldfinch",
                      @"Roadrunner",
                      @"Bluebird",
                      @"Cardinal",
                      @"Western Meadowlark",
                      @"Cardinal",
                      @"Scissor-tailed Flycatcher",
                      @"Western Meadowlark",
                      @"Ruffed Grouse",
                      @"Rhode Island Red",
                      @"Great Carolina Wren",
                      @"Ring-necked Pheasant",
                      @"Mockingbird",
                      @"Mockingbird",
                      @"Common American Gull",
                      @"Hermit Thrush",
                      @"Cardinal",
                      @"Willow Goldfinch",
                      @"Cardinal",
                      @"Robin",
                      @"Western Meadowlark",
                      ];
    
}

@end
