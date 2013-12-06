//
//  DetailsViewController.m
//  ScanBarCodes
//
//  Created by Roberto Silva on 25/10/13.
//  Copyright (c) 2013 Infragistics. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bornDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *rgLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;

@end

@implementation DetailsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"code:%@",self.barcode);
    
    self.codeLabel.text = self.barcode;
    [self fillData];
    
}

- (void)fillData
{
    NSDictionary *data = [DetailsViewController dataForCodeID:self.barcode];
    
    self.nameLabel.text = [data objectForKey:@"name"];
    self.rgLabel.text = [data objectForKey:@"rg"];
    self.bornDateLabel.text = [data objectForKey:@"born"];
}

- (IBAction)close:(id)sender
{
    [self.delegate close];
}

+ (NSDictionary *)dataForCodeID:(NSString *)code
{
    NSDictionary *returnData = nil;
    static NSDictionary *data = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = @{@"240167":@{@"name":@"José Almeida Santana",@"born":@"12/03/1982",@"rg":@"08316700-47"},
                 @"130057":@{@"name":@"Maria Antônia Nascimento",@"born":@"23/11/1954",@"rg":@"02376010-12"},
                 @"279371":@{@"name":@"Luiz Ricardo",@"born":@"04/07/1969",@"rg":@"00546790-88"},
                 @"871271":@{@"name":@"Carlos Augusto da Silva",@"born":@"11/01/1971",@"rg":@"04516700-27"},
                 @"098288":@{@"name":@"Antonio Jorge de Oliveira",@"born":@"22/02/1965",@"rg":@"08312330-21"},
                 @"172661":@{@"name":@"Carolina Mendes",@"born":@"19/08/1988",@"rg":@"19300123-89"},
                 @"910071":@{@"name":@"Gabriela dos Santos",@"born":@"15/07/1977",@"rg":@"02387546-07"},
                 @"default":@{@"name":@"John Doe",@"born":@"Desconhecido",@"rg":@"Não apresentado"}
                };
  
    });
    
    returnData = [data objectForKey:code];
    
    if (!returnData) {
        returnData = [data objectForKey:@"default"];
    }
    
    return returnData;
}
@end
