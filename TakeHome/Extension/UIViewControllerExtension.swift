//
//  UIViewControllerExtension.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/29/22.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, completion: @escaping(UIAlertAction) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
