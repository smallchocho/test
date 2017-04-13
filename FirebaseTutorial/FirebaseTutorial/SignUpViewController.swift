//
//  SignUpViewController.swift
//  FirebaseTutorial
//
//  Created by James Dacombe on 16/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import FirebaseAuth
class SignUpViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let customMethod = CustomMethod()
    //Sign Up Action for email
    @IBAction func createAccountAction(_ sender: AnyObject) {
        //if email is empty, display error alert  
        if emailTextField.text == ""||passwordTextField.text == ""{
            customMethod.presentAlert(vc:self,alertTitle: "錯誤!", alertMessage: "Email或Password欄位沒有輸入喔", actionTitle: "OK", actionHandler: nil)
        }else{
            // 如果email不是空的，把email跟password傳給Firebase
            FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user:FIRUser?, error:Error?) in
                guard error == nil else{
                    self.customMethod.presentAlert(vc:self,alertTitle: "error", alertMessage: error?.localizedDescription, actionTitle: "OK", actionHandler: nil)
                    return
                }
                self.customMethod.presentAlert(vc:self,alertTitle: "success", alertMessage: "創建帳號成功", actionTitle: "OK", actionHandler:{
                    (action:UIAlertAction) in
                    //帳號創立成功轉Home頁面
                    self.customMethod.presentPage(vc:self,identifier: "Home")
                })
            })
        }
    }
}

