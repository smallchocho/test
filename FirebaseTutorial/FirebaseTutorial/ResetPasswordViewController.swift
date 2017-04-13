//
//  ResetPasswordViewController.swift
//  FirebaseTutorial
//
//  Created by James Dacombe on 16/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import FirebaseAuth
class ResetPasswordViewController: UIViewController {
    let customMethod = CustomMethod()
    // Outlets
    @IBOutlet weak var emailTextField: UITextField!
    // Reset Password Action
    @IBAction func submitAction(_ sender: AnyObject){
        if emailTextField.text == ""{
            self.customMethod.presentAlert(vc:self,alertTitle: "error", alertMessage: "沒有輸入email", actionTitle: "OK", actionHandler: nil)
        }else{
            FIRAuth.auth()?.sendPasswordReset(withEmail: emailTextField.text!, completion: { (error:Error?) in
                if error == nil{
                    self.customMethod.presentAlert(vc:self,alertTitle: "成功", alertMessage: "修改密碼信已寄至你的信箱", actionTitle: "OK", actionHandler: nil)
                }else{
                    self.customMethod.presentAlert(vc:self,alertTitle: "失敗", alertMessage: error?.localizedDescription, actionTitle: "OK", actionHandler: nil)
                }
            })
        }
    }
}

