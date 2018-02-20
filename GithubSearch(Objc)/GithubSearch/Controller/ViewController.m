//
//  ViewController.m
//  GithubSearch(Objc)
//
//  Created by Nathan on 19/02/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *repoNameTextField;
@property (weak, nonatomic) IBOutlet UITableView *reposTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) searchForGithub: (NSString *) repoName {
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self searchForGithub: textField.text];
    return true;
}
@end
