//
//  RootViewController.m
//  Tarefas
//
//  Created by Matheus Brum on 07/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "TarefasAppDelegate.h"
#import "MBInput.h"
#import "GradientView.h"
@implementation RootViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem=[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(adicionarTarefa)]autorelease];
    self.navigationController.navigationBar.tintColor=[UIColor darkGrayColor];
    self.tableView.backgroundColor=[UIColor lightGrayColor];
    self.navigationItem.leftBarButtonItem=self.editButtonItem;
    self.title=@"Tarefas";
}
-(void)adicionarTarefa{
    [MBInput showPanelInView:self.parentViewController.view onTextEntered:
     ^(NSString *inputString){
         if ([inputString length]!=0) {
             [self.tableView beginUpdates];
             [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]]withRowAnimation:UITableViewRowAnimationTop];
             [[TarefasAppDelegate sharedDelegate]adicionarTarefa:inputString];
             [self.tableView endUpdates];
         }
     }];
}
// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[TarefasAppDelegate sharedDelegate]arrayMaster]count];
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text=(NSString *)[[[TarefasAppDelegate sharedDelegate]arrayMaster]objectAtIndex:indexPath.row];
    for ( UIView* view in cell.contentView.subviews ) {
        view.backgroundColor = [ UIColor clearColor ];
    }
    cell.backgroundView = [[[GradientView alloc] init] autorelease];
    cell.textLabel.font=[UIFont fontWithName:@"GillSans Bold" size:25];
    cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
    cell.textLabel.textColor = [UIColor darkGrayColor];    
    return cell;
}
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        // Delete the row from the data source.
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [[TarefasAppDelegate sharedDelegate] deletarTarefaNoIndex:indexPath.row];
        [tableView endUpdates];
    }else if (editingStyle == UITableViewCellEditingStyleInsert){
    }   
}
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    [[TarefasAppDelegate sharedDelegate] moverTarefaDoIndex:fromIndexPath.row paraIndex:toIndexPath.row];
}
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}
- (void)viewDidUnload{
    [super viewDidUnload];
}
- (void)dealloc{
    [super dealloc];
}
@end
