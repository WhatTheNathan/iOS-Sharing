//
//  ViewController.m
//  GithubSearch(Objc)
//
//  Created by Nathan on 19/02/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "RepoTableViewCell.h"
#import "RepoInfo.h"

@interface ViewController () <UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *repoTextField;
@property (weak, nonatomic) IBOutlet UITableView *repoTableView;

@property (nonatomic, copy) NSMutableArray *repos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.repoTableView setDelegate:self];
    [self.repoTableView setDataSource:self];
    [self.repoTextField setDelegate:self];
}

- (void) searchForGithub: (NSString *) repoName {
    NSString *url = @"https://api.github.com/search/repositories";
    NSDictionary *parameters = @{@"q": [repoName stringByAppendingString:@"stars:>5000"]};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
        NSArray *items = responseObject[@"items"];
        NSMutableArray *repoSection = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < items.count; i++) {
            NSString *name = items[i][@"name"];
            NSURL *detail_url = [NSURL URLWithString: items[i][@"html_url"] ];
            NSURL *image_url = [NSURL URLWithString: items[i][@"owner"][@"avatar_url"] ];
            NSString *description = items[i][@"description"];
            RepoInfo *repo = [RepoInfo initWithName:name detailUrl:detail_url imageUrl:image_url Description:description];
            [repoSection addObject:repo];
        }
        [self.repos removeAllObjects];
        [self.repos addObject:repoSection];
        [self updateUI];
        NSLog(@"here");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void) updateUI {
    [self.repoTableView reloadData];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self searchForGithub: textField.text];
    return true;
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.repos count];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu",(unsigned long)[self.repos[section] count]);
    return [self.repos[section] count];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"fuck");
    RepoTableViewCell *cell;
    NSString *cellId= @"repos";
    cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    cell.repoInfo = self.repos[indexPath.section][indexPath.row];
    [cell updateUI];
    return cell;
}

@end
