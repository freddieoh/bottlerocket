//
//  BRTCollectionViewController.m
//  BottleRocket
//
//  Created by Fredrick Ohen on 1/25/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import "BRTRestaurantViewController.h"
#import "BRTRestaurantDetailViewController.h"
#import "BRTRestaurant.h"
#import "BRTRestaurantCell.h"

@interface BRTRestaurantViewController ()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionTask *sessionTask;
@property (nonatomic, strong) NSCache *imageCache;
@property (nonatomic, copy) NSArray *restaurants;

@end

@implementation BRTRestaurantViewController

static NSString * const cellIdentifier = @"RestaurantCell";
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
    _sessionTask = [self.session dataTaskWithRequest:request
                                   completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
                                       NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                                  options:0
                                                                                                    error:nil];
                                       
                                       self.restaurants = jsonObject[@"restaurants"];
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
    cell.tag = indexPath.row;
    NSDictionary *restaurant = self.restaurants[indexPath.row];
    if (restaurant)
    {
        cell.restaurantImageView.image = nil;
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^(void) {
            
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:restaurant[@"backgroundImageURL"]]];
            [self.imageCache setObject:imageData forKey:restaurant[@"backgroundImageURL"]];
            
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
        
        cell.restaurantNameLabel.text = restaurant[@"name"];
        cell.categoryLabel.text = restaurant[@"category"];
        
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}

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



 #pragma mark - Navigation

// - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
// // Get the new view controller using [segue destinationViewController].
// // Pass the selected object to the new view controller.
//     if([segue.identifier isEqualToString:@"RestaurantSegue"]){
//         UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
//         BRTRestaurantDetailViewController *controller = (BRTRestaurantDetailViewController *)navController.topViewController;
//         controller.restaurantNameLabel.text = @"test";
//
//     }
 //}


@end
