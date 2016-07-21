//
//  MainViewController.m
//  Shui
//
//  Created by HeBin on 16/6/28.
//  Copyright © 2016年 Myzle. All rights reserved.
//

#import "MainViewController.h"
#import "SearchResult.h"
#import "SearchResultCell.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation MainViewController
{
    NSMutableArray *_searchResults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *cellNib = [UINib nibWithNibName:@"SearchResultCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"SearchResultCell"];
    self.tableView.rowHeight = 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_searchResults == nil) {
        return 0;
    } else if ([_searchResults count] == 0) {
        return 1;
    } else {
        return [_searchResults count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchResultCell *cell = (SearchResultCell *)[tableView dequeueReusableCellWithIdentifier:@"SearchResultCell"];

    if ([_searchResults count] == 0) {
        cell.nameLabel.text = @"(Nothing found)";
    } else {
        SearchResult *searchResult = _searchResults[indexPath.row];
        cell.nameLabel.text = searchResult.name;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_searchResults count] == 0) {
        return nil;
    } else {
        return indexPath;
    }
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
