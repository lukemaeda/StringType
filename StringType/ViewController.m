//
//  ViewController.m
//  StringType
//
//  Created by kunren10 on 2015/06/11.
//  Copyright (c) 2014年 Hajime Maeda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *teString;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// NSString[作成]ボタンを押した時 コストが低い（メモリーを使わない）
- (IBAction)proc01:(id)sender{
    
    self.teString.text = nil;
    // パターン１
    NSString *str01 = @"あいうえお";
    NSLog(@"%@", str01);
    
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", str01];
    
    // 禁じ手 御法度使ってはいけない いちど入力されているものは使えない
    // str01 メモリーが２つ存在するためメモリーリークになる
    str01 = @"アイウエオ";
    NSLog(@"%@", str01);
    
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", str01];
    
    // パターン２（標準イニシャライザ）　init:初期化
    NSString *str02 = [[NSString alloc] init];
    str02 = @"かきくけこ";
    NSLog(@"%@", str02);
    
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", str02];

    // パターン３（指定イニシャライザ） initWithString:初期化と値の代入
    // 警告メッセージが出ているのはパターン１がメインになったので出ている　今後はパターン１を使って行く
//    NSString *str03 = [[NSString alloc] initWithString:@"さしすせそ"];
//    NSLog(@"%@", str03);
    
}

// NSString[連結]ボタンを押した時
- (IBAction)proc02:(id)sender{
    
    // 接続対象
    NSString *str00 = @"私は";
    
    // パターン１ クラス NSString commandキー + stringWithFormat 確認
    NSString *str01 = [NSString stringWithFormat:@"%@イカです。", str00];
    NSLog(@"%@", str01);
    
    // パターン２ インスタンス str00 commandキー + stringByAppendingString 確認
    NSString *str02 = [str00 stringByAppendingString:@"タコです"];
    NSLog(@"%@", str02);
    
    // パターン３ インスタンス str00 commandキー + stringByAppendingFormat 確認
    NSString *str03 = [str00 stringByAppendingFormat:@"%@",@"マンボウです"];
    NSLog(@"%@", str03);
    
    // TextView表示メソッド呼出 引数：文字タイプ 6個
    [self doMethod01:str01
                    :str02
                    :str03
                    :@""
                    :@""
                    :@""];
    
}

// NSString[書式指定]ボタンを押した時
- (IBAction)proc03:(id)sender{
    
    // パターン１
    int num01 = 12;
    NSString *str01 = [NSString stringWithFormat:@"%d", num01];
    NSLog(@"%@", str01);
    
    // パターン２
    NSString *str02 = [NSString stringWithFormat:@"%d:%d:%d", 12, 15, 30];
    NSLog(@"%@", str02);

    // パターン３
    NSString *str03 = [NSString stringWithFormat:@"%4d", 78];
    NSLog(@"%@", str03);
    
    // パターン４
    NSString *str04 = [NSString stringWithFormat:@"%04d", 80];
    NSLog(@"%@", str04);
    
    // パターン５
    NSString *str05 = [NSString stringWithFormat:@"%f", 1.23];
    NSLog(@"%@", str05);
    
    // パターン６ 小数点2桁 (g e)
    NSString *str06 = [NSString stringWithFormat:@"%.2f", M_PI];
    NSLog(@"%@", str06);
    
    // TextView表示メソッド呼出 引数：文字タイプ 6個
    [self doMethod01:str01
                    :str02
                    :str03
                    :str04
                    :str05
                    :str06];
}

// NSString[文字数]ボタンを押した時
- (IBAction)proc04:(id)sender{
    
    self.teString.text = nil;
    
    // 対象文字列
    NSString *str00 = @"あいうえお";
    
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", str00];
    
    long len = str00.length;
    NSLog(@"%ld文字", len);
    
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%ld\n", len];
    
}

// NSString[文字列部分取得]ボタンを押した時
- (IBAction)proc05:(id)sender{
    
    // 対象文字列
    NSString *str00 = @"iPhone";
    
    // パターン１
    NSString *str01 = [str00 substringToIndex:3];
    NSLog(@"%@文字", str01);// iPh
    
    // パターン２
    NSString *str02 = [str00 substringFromIndex:2];
    NSLog(@"%@文字", str02); // hone
    
    // パターン３
    // NSRange構造体 範囲の指定 複数の変数を保持する
    //NSRange rng = NSMakeRange(2, 3);
    
    // NSMakeRangeと同じ　構造体
    NSRange rng;
    rng.location = 2;
    rng.length = 3;
    
    NSString *str03 = [str00 substringWithRange:rng];
    NSLog(@"%@文字", str03); // hon
    
    // TextView表示メソッド呼出 引数：文字タイプ 6個
    [self doMethod01:str01
                    :str02
                    :str03
                    :@""
                    :@""
                    :@""];
}

// NSString[文字列比較]ボタンを押した時
- (IBAction)proc06:(id)sender{
    
    self.teString.text = nil;
    
    // 対象文字列
    NSString *str01 = @"iPhone";
//    NSString *str02 = @"iPad";
    NSString *str02 = @"iPhone";
    
    // 比較
    BOOL ret = [str01 isEqualToString:str02];
    
    // if (ret == YES)
    if (ret) {
        NSLog(@"同じ");
        NSString *str03 = @"同じ";
        self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", str03];
    } else {
        NSLog(@"違う");
        NSString *str03 = @"違う";
        self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", str03];
    }
    
//    NSLog(@"%@", ret ? @"同じ" : @"違う");
    
    
    // 比較　文字の比較では無くメモリーの比較になり使ってはいけない
//    if (str01 == str02) {
//        NSLog(@"同じです");
//    } else {
//        NSLog(@"違うです");
//    }


}

// NSMutableString[作成]ボタンを押した時 コストが高い（メモリーをよく使う）
- (IBAction)proc01m:(id)sender{
    
    // パターン１（簡易コンストラクタ）
    //NSMutableString *str01 = @"あいうえお"; // NSString用のため警告がでる使えない
    NSMutableString *str01 = [NSMutableString stringWithString:@"あいうえお"];
    NSLog(@"%@", str01);
    
    // パターン２（標準イニシャライザ）
    NSMutableString *str02 = [[NSMutableString alloc] init];
    [str02 setString:@"かきくけこ"]; // setStringをかます
    NSLog(@"%@", str02);
    
    // パターン３（指定イニシャライザ）
    NSMutableString *str03 = [[NSMutableString alloc]initWithString:@"さしすせそ"];
    NSLog(@"%@", str03);
    
    // TextView表示メソッド呼出 引数：文字タイプ 6個
    [self doMethod01:str01
                    :str02
                    :str03
                    :@""
                    :@""
                    :@""];
}

// NSMutableString[連結]ボタンを押した時
- (IBAction)proc02m:(id)sender{
    
    // パターン１
    NSMutableString *str01 = [NSMutableString stringWithString:@"あなたは"];
    [str01 appendString:@"イカです"];
    NSLog(@"%@", str01);
    
    // パターン２
    NSMutableString *str02 = [NSMutableString stringWithString:@"あなたは"];
    // 書式フォーマット
    [str02 appendFormat:@"%@です", @"タコ"];
    NSLog(@"%@", str02);
    
    // TextView表示メソッド呼出 引数：文字タイプ 6個
    [self doMethod01:str01
                    :str02
                    :@""
                    :@""
                    :@""
                    :@""];
    
}

// NSMutableString[挿入]ボタンを押した時
- (IBAction)proc03m:(id)sender{
    
    self.teString.text = nil;
    
    // 対象文字列
    NSMutableString *str =[NSMutableString stringWithString:@"スティーブジョブズ"];
    
    // 挿入
    [str insertString:@"・" atIndex:5];
    
    NSLog(@"%@", str);
    
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", str];

}

// NSMutableString[置換]ボタンを押した時
- (IBAction)proc04m:(id)sender{
    
    self.teString.text = nil;
    
    // 対象文字列
    NSMutableString *str =[NSMutableString stringWithString:@"スティーブ・ジョブズ"];
    
    // 置換
    // NSRange構造体
    NSRange rng = NSMakeRange(6, 4);
    [str replaceCharactersInRange:rng
                       withString:@"ウォズニアック"];
    
    NSLog(@"%@", str);
    
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", str];
}

// NSMutableString[削除]ボタンを押した時
- (IBAction)proc05m:(id)sender{
    
    self.teString.text = nil;
    
    // 対象文字列
    NSMutableString *str =[NSMutableString stringWithString:@"スティーブ・ジョブズ"];
    
    // 削除
    [str deleteCharactersInRange:NSMakeRange(5, 5)];
    
    NSLog(@"%@", str);
    
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", str];

}

// TextView表示メソッド呼出 引数：文字タイプ 6個
- (void)doMethod01:(NSString*)arg01
                  :(NSString*)arg02
                  :(NSString*)arg03
                  :(NSString*)arg04
                  :(NSString*)arg05
                  :(NSString*)arg06
{
    
    self.teString.text = nil;
    
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", arg01];
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", arg02];
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", arg03];
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", arg04];
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", arg05];
    self.teString.text = [self.teString.text stringByAppendingFormat:@"%@\n", arg06];
}
@end
