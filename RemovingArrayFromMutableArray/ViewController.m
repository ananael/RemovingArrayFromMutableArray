//
//  ViewController.m
//  RemovingArrayFromMutableArray
//
//  Created by Michael Hoffman on 5/12/16.
//  Copyright © 2016 Here We Go. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSMutableArray *mutArray;
@property NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
/*
 The purpose of this exercise is to have an array of random indices remove the corresponding indices of a mutable array WITHOUT affecting the original order of the mutable array's elements.
 
 Example Application:
    Quiz game.
    Game selects questions from mutable array of questions via randomly chosen index
    numbers. The random indices are stored in another mutable array.  If the player closes
    the app then reopens to continue play, the array of indices can be used to remove the
    same used questions from the array of questions so that the user is not asked the same
    question again.
*/
    self.mutArray = [NSMutableArray new];
    self.array = [NSArray new];
    
    //self.mutArray contains strings named for the index number they occupy.
    self.mutArray = [NSMutableArray arrayWithObjects:@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", nil];
    
    //self.array contains numbers that represent the index "used"
    //These numbers will be removed from self.mutArray such that the string representing each number will be taken out.
    self.array = @[@7, @0, @3, @5, @9, @4];
    
    //Sorts the array of numbers from low to high
    NSArray *ascending = [self.array sortedArrayUsingSelector: @selector(compare:)];
    NSLog(@"Ascending: %@", ascending);
    
    //Sorts the array of numbers from high to low
    NSArray *descending = [[[self.array sortedArrayUsingSelector:@selector(compare:)] reverseObjectEnumerator] allObjects];
    NSLog(@"Descending: %@", descending);
    
    //Use the descending array to remove objects from the mutableArray
    //Done this way, the correct objects will be removed from the mutableArray without affecting the order
    for (NSInteger i=0; i<[self.array count]; i++)
    {
        NSNumber *indexNumber = [descending objectAtIndex:i];
        [self.mutArray removeObjectAtIndex:[indexNumber integerValue]];
        
        //NSLog was placed within the loop to show that for each pass,
        //the index is removed in a manner that maintains the original order of self.mutArray.
        NSLog(@"Remaining: %@", self.mutArray);
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
