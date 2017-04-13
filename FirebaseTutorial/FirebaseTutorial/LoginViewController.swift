//
//  LoginViewController.swift
//  FirebaseTutorial
//
//  Created by James Dacombe on 16/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {
    let customMethod = CustomMethod()
    //Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    //Login Action
    @IBAction func loginAction(_ sender: AnyObject) {
        
        //檢查email跟密碼有沒有輸入
        if emailTextField.text == "" || passwordTextField.text == ""{
            self.customMethod.presentAlert(vc:self,alertTitle: "錯誤!", alertMessage: "Email跟Password不可為空白", actionTitle: "OK", actionHandler: nil)
        }else{
            //如果帳密都有填，就嘗試登入，如果有error，就跳Alert出來顯示錯誤訊息
            FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {
                (user:FIRUser?, error:Error?) in
                if error == nil {
                    //登入成功就轉Home頁面
                    self.customMethod.presentAlert(vc:self,alertTitle: "登入成功!", alertMessage: nil, actionTitle: "OK", actionHandler: {
                        (action:UIAlertAction) in
                        self.customMethod.presentPage(vc:self,identifier: "Home")
                    })
                }else{
                    self.customMethod.presentAlert(vc:self,alertTitle: "登入錯誤!", alertMessage: error?.localizedDescription, actionTitle: "OK", actionHandler: nil)
                }
            })
        }
    }
}

