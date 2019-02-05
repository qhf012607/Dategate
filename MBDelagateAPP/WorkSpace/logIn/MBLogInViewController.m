//
//  MBLogInViewController.m
//  MBDelagateAPP
//
//  Created by inara on 2018/10/23.
//  Copyright © 2018年 rhonin. All rights reserved.
//

#import "MBLogInViewController.h"
#import "MBTextfield.h"
#import "MBAlertView.h"
#import "NSString+Calculation.h"
@interface MBLogInViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) MBTextfield * accountTf;
@property (nonatomic, strong) MBTextfield * passwordTf;


@property (nonatomic, strong) MBAlertView * accountAlert;
@property (nonatomic, strong) MBAlertView * passwordAlert;



@end

@implementation MBLogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}


-(void)initUI{
    
    //登录背景
    UIImageView * imageBg = [[UIImageView alloc] init];
    [self.view addSubview:imageBg];
    
    [imageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(kScreenHeight);
    }];
    
    
    imageBg.image = [UIImage imageNamed:@"MBloginbg"];
    imageBg.userInteractionEnabled = YES;
    
    
    
    //账户输入框
    _accountTf = [[MBTextfield alloc] init];
    [imageBg addSubview:_accountTf];
    _accountTf.mbTextImage = @"icon-accont";
    _accountTf.mbSelectTextImage = @"icon-accon2t";
    __weak MBLogInViewController * weakself = self;
    [_accountTf mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(weakself.view).offset(212);
        make.left.mas_equalTo(weakself.view).offset(45);
        make.right.mas_equalTo(weakself.view).offset(-45);
        make.height.mas_equalTo(60);

    }];
    
    
    _accountTf.placeholder = @"账户";

    [_accountTf setIsSelect:@"light"];

    _accountTf.mbTextField.delegate = self;
    
    
    //密码输入框
    _passwordTf = [[MBTextfield alloc] init];
    [imageBg addSubview:_passwordTf];
    _passwordTf.mbTextImage = @"icon-lock";
    _passwordTf.mbSelectTextImage = @"icon-lock2";
    [_passwordTf mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(weakself.accountTf.mas_bottom).offset(38);
        make.left.right.mas_equalTo(weakself.accountTf);
        make.height.mas_equalTo(60);
        
    }];
    
    
    _passwordTf.placeholder = @"密码";

    [_passwordTf setIsSelect:@"dark"];


    _passwordTf.mbTextField.delegate = self;
    
    
    
    //登录按钮
    UIButton * logIn = [[UIButton alloc] init];
    [imageBg addSubview:logIn];
    [logIn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.passwordTf.mas_bottom).offset(40);
        make.height.mas_equalTo(60);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(210);
    }];
    
    [logIn setImage:[UIImage imageNamed:@"sing-in"] forState:UIControlStateNormal];
    
    [logIn addTarget:self action:@selector(logInOnClick) forControlEvents:UIControlEventTouchUpInside];
    


    _accountAlert = [[MBAlertView alloc] init];
    [imageBg addSubview:_accountAlert];
    
    [_accountAlert mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakself.accountTf.mas_bottom).offset(-22);
        make.right.mas_equalTo(weakself.accountTf);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(157);
    }];
    _accountAlert.messege = @"请输入4-11个字符,仅可输入英文字母以及数字的组合";
    [_accountAlert setIsMistake:@"No"];
    
    
    _passwordAlert = [[MBAlertView alloc] init];
    [imageBg addSubview:_passwordAlert];
    
    [_passwordAlert mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakself.passwordTf.mas_bottom).offset(-22);
        make.right.mas_equalTo(weakself.passwordTf);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(157);
    }];
    
    _passwordAlert.messege = @"请输入4-11个字符,仅可输入英文字母以及数字的组合";
    [_passwordAlert setIsMistake:@"No"];
    _passwordAlert.hidden = YES;
    
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{

    if ([_accountTf.mbTextField isFirstResponder]) {
        [_accountTf setIsSelect:@"light"];
        [_passwordTf setIsSelect:@"dark"];
        
        _passwordAlert.hidden = YES;
        _accountAlert.hidden = NO;
        
    }else{
        [_accountTf setIsSelect:@"dark"];
        [_passwordTf setIsSelect:@"light"];
        
        _passwordAlert.hidden = NO;
        _accountAlert.hidden = YES;
    }
    
    
    if (_accountTf.mbTextField.text.length>0||_passwordTf.mbTextField.text.length>0) {
        _accountAlert.hidden = YES;
        _passwordAlert.hidden = YES;
    }
    
    
    
}


//登录按钮点击事件
-(void)logInOnClick{
   
    if ([NSString judgePassWordLegal:_accountTf.mbTextField.text]) {
        NSDictionary *dic = @{@"username":@"mx360qun",@"password":@"mx360qun"};
        [MBProgressHUD showDefaultHudtoView:self.view];
        WEAKSELF;
        [[PRNetWork loginWith:dic]subscribeNext:^(id x) {
            //请求登录
             [MBProgressHUD hideHUDForView:weakSelf.view];
            MBBaseViewController *cont = [[MBBaseViewController alloc]init];
            cont.hiddenNav = true;
            MBNavigationController *nave = [[MBNavigationController alloc]initWithRootViewController:cont];
            GGappDelegate.window.rootViewController = nave;
            GGappDelegate.rootNave = nave;
            GGappDelegate.baseController = cont;
        } error:^(NSError *error) {
            [MBProgressHUD hideHUDForView:weakSelf.view];
            [MBProgressHUD showMessage:[PRNetWork getErrorString:error.code] toView:weakSelf.view];
        }];
       
    }else {
        
        _accountAlert.messege = @"输入不符合要求";
        [_accountAlert setIsMistake:@"Yes"];
        _accountAlert.hidden = NO;
        
        [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector: @selector(performDismiss)
                                       userInfo:nil repeats:NO];
        
    }
    
    
}


-(void)performDismiss{
    _accountAlert.messege = @"请输入4-11个字符,仅可输入英文字母以及数字的组合";
    [_accountAlert setIsMistake:@"NO"];
    _accountAlert.hidden = YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
