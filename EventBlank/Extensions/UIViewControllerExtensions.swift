//
//  UIViewControllerExtensions.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/28/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(with title: String? = nil,
                   alertMessage: String? = nil) {
        let okAction = AlertAction(name: "OK", action: {})
        let alert = UIAlertController(info: AlertInfo(title: title, message: alertMessage, actions: [okAction]))
        self.present(alert, animated: true)
    }
}
