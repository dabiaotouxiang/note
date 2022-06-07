//
//  ContactViewController.m
//  UIAdvance03
//
//  Created by lsb on 2022/5/26.
//

#import "ContactViewController.h"
#import "AddViewController.h"
#import "EditViewController.h"
#import "Contact.h"
@interface ContactViewController () <AddViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) NSMutableArray *contacts;
@end

@implementation ContactViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"contact2edit" sender:nil];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.contacts removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSMutableArray *)contacts{
    if (_contacts == nil){
        _contacts = [NSMutableArray new];
    }
    return _contacts;
}

- (void)viewWillAppear:(BOOL)animated{
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *path = [tmpPath stringByAppendingPathComponent:@"contacts.plist"];
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:path];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (![segue.identifier isEqualToString: @"contact2edit"]){
        AddViewController *addController = segue.destinationViewController;
        addController.delegate = self;
    }else{
        EditViewController *controller = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Contact *contact = self.contacts[indexPath.row];
        controller.contact =contact;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%@", indexPath);
    static NSString *cellId = @"contactId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.number;
    return cell;
}

- (void)addContactWithController:(AddViewController *)controller andName:(NSString *)name andNumber:(NSString *)number{
    Contact *contact = [Contact new];
    contact.name = name;
    contact.number = number;
    [self.contacts addObject:contact];
    NSIndexPath *indexPath =[NSIndexPath indexPathForRow:(self.contacts.count -1)  inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [controller.navigationController popViewControllerAnimated:YES];
    
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *path = [tmpPath stringByAppendingPathComponent:@"contacts.plist"];
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:path];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
    
    self.navigationItem.leftBarButtonItem = cancelBtn;
    
    self.navigationItem.title = self.title;
    
    
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *path = [tmpPath stringByAppendingPathComponent:@"contacts.plist"];
    self.contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    // Do any additional setup after loading the view.
}

- (void) cancelClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定注销吗?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action  = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
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
