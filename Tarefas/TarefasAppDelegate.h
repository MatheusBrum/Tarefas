//
//  TarefasAppDelegate.h
//  Tarefas
//
//  Created by Matheus Brum on 07/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TarefasAppDelegate : NSObject <UIApplicationDelegate>{
    NSMutableArray *arrayMaster;
}
+ (TarefasAppDelegate *) sharedDelegate;
-(void)adicionarTarefa:(NSString *)tarefa;
-(void)deletarTarefaNoIndex:(NSUInteger)index;
-(void)moverTarefaDoIndex:(NSUInteger)indexPassado paraIndex:(NSUInteger)indexFuturo;
@property (nonatomic, retain)    NSMutableArray *arrayMaster;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
