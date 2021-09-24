//
//  CardTableViewController.m
//  Card
//
//  Created by Matte on 23/09/21.
//

/*
 TODO
 controllo per valori nulli delle nuove carte
 mostrare il qr code
 color picker per il colore della carta
 */

#import "CardTableViewController.h"
#import "AddCardViewController.h"
#import "CardDetailTableViewController.h"

@interface CardTableViewController () <AddCardDelegate>
@property (nonatomic, strong) NSMutableArray *nameCards;
@property (nonatomic, strong) NSMutableArray *clientId;
@end

@implementation CardTableViewController

- (NSMutableArray *)nameCards{
    if (_nameCards == nil) {
        _nameCards = [[NSMutableArray alloc] init];
    }
    return _nameCards;
}
- (NSMutableArray *)clientId{
    if (_clientId == nil) {
        _clientId = [[NSMutableArray alloc] init];
    }
    return _clientId;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"LoyaltyCards";
    
    self.nameCards = [NSMutableArray arrayWithObjects:@"carta1", @"aahdgadhgjagdj",nil];
    self.clientId = [NSMutableArray arrayWithObjects:@"12345", @"aahdgadhgjagdj", nil];
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.nameCards.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
        
    }
    cell.textLabel.text = [self.nameCards objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.clientId objectAtIndex:indexPath.row];
    
    return cell;
}

  
    
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"AddCard"]) {
        [ (AddCardViewController *)segue.destinationViewController setDelegate:self];
    }
    else if ([ segue.identifier isEqualToString:@"CardDetail"]){
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        CardDetailTableViewController *controller1 = (CardDetailTableViewController *)navController.topViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        controller1.compNameDetail = [self.nameCards objectAtIndex:indexPath.row];
        controller1.clientIdDetail = [self.clientId objectAtIndex:indexPath.row];
        }
}


-(void)saveCardName:(NSString *)corpName clientId:(NSString *)clientId{
    
        [self.nameCards addObject:corpName];
        [self.clientId addObject:clientId];
        [self.tableView reloadData];
        [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.nameCards removeObjectAtIndex:indexPath.row];
        [self.clientId removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

@end
