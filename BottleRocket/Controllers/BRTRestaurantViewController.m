//
//  BRTCollectionViewController.m
//  BottleRocket
//
//  Created by Fredrick Ohen on 1/25/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import "BRTRestaurantViewController.h"
#import "BRTRestaurantCell.h"
#import "BRTRestaurantDetailViewController.h"

@interface BRTRestaurantViewController ()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionTask *sessionTask;
@property (nonatomic, strong) NSCache *imageCache;
@property (nonatomic) NSMutableArray *restaurants;


@end

@implementation BRTRestaurantViewController

static NSString * const cellIdentifier = @"RestaurantCell";
static NSString * const segueIdentifier = @"RestaurantSegue";
static NSString * const restaurantURL = @"http://sandbox.bottlerocketapps.com/BR_iOS_CodingExam_2015_Server/restaurants.json";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self sessionConfiguration];
    [self fetchJSON];
    
}

- (void)sessionConfiguration {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    _session = [NSURLSession sessionWithConfiguration:config
                                             delegate:nil
                                        delegateQueue:nil];
}

-(void)fetchJSON {
    NSString *requestString = restaurantURL;
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _sessionTask = [self.session
                    dataTaskWithRequest:request
                    completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
                    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                options:0
                                                error:nil];

                        BRTRestaurant *res = [[BRTRestaurant alloc] init];
                        
                    NSMutableArray *restaurants = [NSMutableArray array];
                        
                        for (id restaurantDictionary in jsonDictionary[@"restaurants"]) {
                            
                            NSString *address = [restaurantDictionary valueForKeyPath:@"location.address"];
                            NSLog(@"%@", address);
                            
                            

                            
                                [restaurants addObject:[[BRTRestaurant alloc] initWithDictionary:restaurantDictionary]];}
                            self.restaurants = restaurants;
                        
                        
                            dispatch_async(dispatch_get_main_queue(), ^{
                                [self.collectionView reloadData];
                                       });
                                   }];
    [self.sessionTask resume];
};

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.restaurants count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BRTRestaurantCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    BRTRestaurant *restaurant = self.restaurants[indexPath.row];
        cell.tag = indexPath.row;
        if (restaurant)
        {
            UIImage *defaultImage = [UIImage imageNamed:@"cellGradientBackground"];
            cell.restaurantImageView.image = defaultImage;
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
            dispatch_async(queue, ^(void) {
    
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:restaurant.backgroundImageURL]];
                [self.imageCache setObject:imageData forKey:restaurant.backgroundImageURL];
    
                UIImage* image = [[UIImage alloc] initWithData:imageData];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (cell.tag == indexPath.row) {
                            cell.restaurantImageView.image = image;
                            [cell setNeedsLayout];
                        }
                    });
                }
            });
    
    
    cell.restaurantNameLabel.text = restaurant.name;
    cell.categoryLabel.text = restaurant.category;

}
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:segueIdentifier]) {
        BRTRestaurantDetailViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *indexPath  = [self.collectionView indexPathForCell:(BRTRestaurantCell *)sender];
        BRTRestaurant *restaurant = self.restaurants[indexPath.row];
        detailViewController.name = restaurant.name;
        detailViewController.category = restaurant.category;
        detailViewController.twitter = restaurant.twitter;
        
    }
}


// #pragma mark - CollectionViewLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath; {
    
    return CGSizeMake(collectionView.frame.size.width, 180);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section; {
    
    return 0;
}

@end
