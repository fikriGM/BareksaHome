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
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if (size.width != 0) {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if (size.height != 0) {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
          let border = CALayer()
          border.backgroundColor = color.cgColor
          border.frame = CGRect(x:0, y:self.frame.size.height - width, width:self.frame.size.width, height:width)
          self.layer.addSublayer(border)
      }
}
