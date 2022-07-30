//
//  UIView.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/29/22.
//

import UIKit

extension UIView {
    func showLoader() {
        let blurLoader = BlurLoader(frame: frame)
        blurLoader.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            () -> Void in blurLoader.alpha = 1.0
            
        }
    }
    
    func hideLoad() {
        for subView in subviews {
            if (subviews is BlurLoader) {
                UIView.animate(withDuration: 0.25) {
                    () -> Void in subView.alpha = 0.0
                    
                }
                
                if (self.layer.animationKeys()?.count == 0) {
                    subView.removeFromSuperview()
                }
            }
            
        }
    }
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
