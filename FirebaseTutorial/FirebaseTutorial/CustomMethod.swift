//
//  CustomMethod.swift
//  FirebaseTutorial
//
//  Created by Justin Huang on 2017/1/15.
//  Copyright © 2017年 AppCoda. All rights reserved.
//

import Foundation
import UIKit
class CustomMethod:UIViewController{
    func presentAlert(vc:UIViewController,alertTitle:String?,alertMessage:String?,actionTitle:String?,actionHandler:((UIAlertAction)->Void)?){
        let errorAlert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: actionTitle, style: .cancel, handler: actionHandler)
        errorAlert.addAction(defaultAction)
        vc.present(errorAlert, animated: true, completion: nil)
    }
    func presentPage(vc:UIViewController,identifier:String){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: identifier)
        self.present(vc!, animated: true, completion: nil)
    }
}
