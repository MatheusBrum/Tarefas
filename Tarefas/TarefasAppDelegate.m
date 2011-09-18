//
//  TarefasAppDelegate.m
//  Tarefas
//
//  Created by Matheus Brum on 07/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TarefasAppDelegate.h"
#define PLISTFILE [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"ArrayMasterSalvo.plist"]
@implementation TarefasAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize arrayMaster;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    if ([[NSFileManager defaultManager] fileExistsAtPath:PLISTFILE]) {
        arrayMaster=[[NSMutableArray alloc]initWithContentsOfFile:PLISTFILE];
    }else{
        arrayMaster=[[NSMutableArray alloc]init];
    }
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}
+ (TarefasAppDelegate *) sharedDelegate{
    return (TarefasAppDelegate *)[[UIApplication sharedApplication] delegate];
}
-(void)adicionarTarefa:(NSString *)tarefa{
    [arrayMaster insertObject:tarefa atIndex:0];
}
-(void)deletarTarefaNoIndex:(NSUInteger)index{
    [arrayMaster removeObjectAtIndex:index];
}
-(void)moverTarefaDoIndex:(NSUInteger)indexPassado paraIndex:(NSUInteger)indexFuturo{
    NSString *tarefa=[[arrayMaster objectAtIndex:indexPassado]retain];
    [arrayMaster removeObjectAtIndex:indexPassado];
    [arrayMaster insertObject:tarefa atIndex:indexFuturo];
    [tarefa release];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    [arrayMaster writeToFile:PLISTFILE atomically:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [arrayMaster release];
    [_navigationController release];
    [super dealloc];
}

@end
