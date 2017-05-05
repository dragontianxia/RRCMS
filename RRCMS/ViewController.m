//
//  ViewController.m
//  RRCMS
//
//  Created by Ron on 4/25/17.
//  Copyright © 2017 Ron. All rights reserved.
//

#import "ViewController.h"
#import "RRSegmentController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RRSegmentController *segmentController = [[RRSegmentController alloc] init];
    [self addChildViewController:segmentController];
    [self.view addSubview:segmentController.view];
    [segmentController didMoveToParentViewController:self];
    
//    [self.navigationController pushViewController:segmentController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
}

@end
