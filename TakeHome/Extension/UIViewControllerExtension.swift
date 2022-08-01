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
    
    //MARK:ViewFunctions
    func addSafeBackground(top: UIColor, bottom: UIColor){
        Constants.topBackground.frame = CGRect(x: 0, y: 0, width: Constants.screenWidth, height: Constants.screenHeight*0.5)
        Constants.topBackground.backgroundColor = top
        self.view.addSubview(Constants.topBackground)
        
        Constants.bottomBackground.frame = CGRect(x: 0, y: Constants.topBackground.frame.maxY, width: Constants.screenWidth, height: Constants.screenHeight*0.5)
        Constants.bottomBackground.backgroundColor = bottom
        self.view.addSubview(Constants.bottomBackground)
    }
    
    func getStatusBarHeight() -> CGFloat{
        if #available(iOS 13, *){
            let statusBarHeight: CGFloat = {
                var heightToReturn: CGFloat = 0.0
                for window in UIApplication.shared.windows {
                    if let height = window.windowScene?.statusBarManager?.statusBarFrame.height, height > heightToReturn {
                        heightToReturn = height
                    }
                }
                return heightToReturn
            }()
            return statusBarHeight
        }
        else {
            return UIApplication.shared.statusBarFrame.size.height
        }
    }
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-300, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func display(contentController content: UIViewController, on view: UIView) {
        content.willMove(toParent: self)
        view.addSubview(content.view)
        self.addChild(content)
        content.didMove(toParent: self)
    }
    
}
