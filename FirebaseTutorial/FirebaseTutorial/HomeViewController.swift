//
//  HomeViewController.swift
//  FirebaseTutorial
//
//  Created by James Dacombe on 16/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    let customMethod = CustomMethod()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logOutAction(sender: AnyObject) {
        guard FIRAuth.auth()?.currentUser != nil else{
            //顯示失敗Alert
            customMethod.presentAlert(vc:self,alertTitle: "錯誤", alertMessage: "你尚未登入", actionTitle: "OK", actionHandler: {
                //跳轉到Login頁面
                (action:UIAlertAction) in
                self.customMethod.presentPage(vc:self,identifier: "Login")
            })
            return
        }
        do{
            try FIRAuth.auth()?.signOut()
        }catch let error as NSError {
            print("登出失敗\(error.localizedDescription)")
            customMethod.presentAlert(vc:self,alertTitle: "登出失敗", alertMessage: "已經登出了？", actionTitle: "OK", actionHandler: nil)
            return
        }
        //顯示成功Alert
        customMethod.presentAlert(vc:self,alertTitle: "登出成功", alertMessage: "", actionTitle: "OK", actionHandler:
            //跳轉到Login頁面
            {(action:UIAlertAction) in
            self.customMethod.presentPage(vc:self,identifier: "Login")
        })
    }
}


