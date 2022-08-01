//
//  PerbandinganViewControllerExtesion.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/31/22.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
extension PerbandinganViewController {
    
    func rowCreate(arr: Dictionary<Int, Array<Any>>) -> UIStackView{
        var buttonArray = [UIButton]()
        
        var widthButton = Constants.screenHeight*0.03
        let arrSorted = arr.sorted(by: {$0.key < $1.key})
        let alphaVal = 0.5
        let colorTitle : UIColor = .gray
        
        
        for (key,val) in arrSorted {
            var button = UIButton()
            button.backgroundColor = .white
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: 40).isActive = true
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            button.isUserInteractionEnabled = true
            
            if String(describing: val[0]) == "ALL" {
                isAllTapped = true
                is1WTapped = false
                button.setTitleColor(isAllTapped ?? true ? Constants.greenTitle : UIColor.gray, for: .normal)
                button.addTarget(self, action: #selector(allAction(_:)), for: .touchUpInside)
            }else if String(describing: val[0]) == "1W" {
                isAllTapped = false
                is1WTapped = true
                button.setTitleColor(is1WTapped ?? true ? Constants.greenTitle : UIColor.gray, for: .normal)
                button.addTarget(self, action: #selector(satuWAction(_:)), for: .touchUpInside)
            }
           
            button.setTitleColor(.gray, for: .normal)
            button.setTitle(String(describing: val[0]), for: .normal)
            buttonArray += [button]
            
            
        }
        let subStackView = UIStackView(arrangedSubviews: buttonArray)
        subStackView.axis = .horizontal
        subStackView.distribution = .equalSpacing
        subStackView.alignment = .leading
        subStackView.translatesAutoresizingMaskIntoConstraints = false
        subStackView.spacing = 1
        return subStackView
    }
    
    func rowCreateView(arr: Dictionary<Int, Array<Any>>) -> UIStackView{
        var viewArray = [UIView]()
        
        let widthButton = Constants.screenHeight*0.03
        let arrSorted = arr.sorted(by: {$0.key < $1.key})
        var alphaVal = 0.5
        
        
        for (key,val) in arrSorted {
            let viewList = UIView()
            viewList.translatesAutoresizingMaskIntoConstraints = false
            viewList.widthAnchor.constraint(equalToConstant: 40).isActive = true
            viewList.heightAnchor.constraint(equalToConstant: 40).isActive = true
            viewList.clipsToBounds = true
            if String(describing: val[0]) == "ALLS" {
//                if isAllTapped {
//                    viewList.backgroundColor = Constants.greenTitle
//                }else {
//                    viewList.backgroundColor = .clear
//                }
                
            }else if String(describing: val[0]) == "1WS" {
//                if is1WTapped {
//                    viewList.backgroundColor = Constants.greenTitle
//                }else {
//                    viewList.backgroundColor = .clear
//                }
            } else {
                viewList.backgroundColor = .clear
            }
            
            viewArray += [viewList]
            
        }
        let subStackView = UIStackView(arrangedSubviews: viewArray)
        subStackView.axis = .horizontal
        subStackView.distribution = .equalSpacing
        subStackView.alignment = .leading
        subStackView.translatesAutoresizingMaskIntoConstraints = false
        subStackView.spacing = 1
        return subStackView
    }
    
    func rowCreateName(arr: Dictionary<Int, Array<Any>>) -> UIStackView{
        var buttonArray = [UIButton]()
        
        var widthButton = (Constants.screenWidth - 50)  / 3
        let arrSorted = arr.sorted(by: {$0.key < $1.key})
        let alphaVal = 0.5
        let colorTitle : UIColor = .gray
        
        
        for (key,val) in arrSorted {
            var button = UIButton()
            button.backgroundColor = .white
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 80).isActive = true
            button.widthAnchor.constraint(equalToConstant: CGFloat(widthButton)).isActive = true
            button.backgroundColor = (val[1] as? UIColor)?.withAlphaComponent(CGFloat(alphaVal))
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.numberOfLines = 3
            button.titleLabel?.lineBreakMode = .byCharWrapping
            button.titleLabel?.textAlignment = .center
            button.layer.cornerRadius = 10
            button.isEnabled = false
            button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            button.setTitle(String(describing: val[0]), for: .normal)
          
            buttonArray += [button]
            
            
        }
        let subStackView = UIStackView(arrangedSubviews: buttonArray)
        subStackView.axis = .horizontal
        subStackView.distribution = .equalSpacing
        subStackView.alignment = .leading
        subStackView.translatesAutoresizingMaskIntoConstraints = false
        subStackView.spacing = 1
        return subStackView
    }
    
    
}
