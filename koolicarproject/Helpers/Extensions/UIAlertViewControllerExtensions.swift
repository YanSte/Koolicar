//
//  UIAlertViewControllerExtensions.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import UIKit

public extension UIAlertController {
    /* --------------------------------------------------------------------------- */
    //                          MARK: - Standart Alert
    /* --------------------------------------------------------------------------- */
    
    /**
     Open alert
     
     */
    public class func openKPStandardAlert(
        delegate:UIViewController,
        title:String?,
        message:String?,
        buttonCancel:String,
        buttonMore:[String]? = nil,
        completionOpenedAlert: (() -> ())? = nil,
        completionCancel: ((_ action:UIAlertAction) -> ())?  = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.tintColor = ROBColor.A.color()
        
        let cancelAction = UIAlertAction(title: buttonCancel, style: .cancel, handler: completionCancel)
        alertController.addAction(cancelAction)
        
        if let buttonMore = buttonMore {
            for b in buttonMore {
                let cancelAction = UIAlertAction(title: b, style: .default, handler: completionCancel)
                alertController.addAction(cancelAction)
            }
        }
        
        
        
        delegate.present(alertController, animated: true) {
            completionOpenedAlert?()
        }
    }
}
