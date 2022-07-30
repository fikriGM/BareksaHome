//
//  PerbandinganViewController.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class PerbandinganViewController: UIViewController {
    
    var perbandingView = PerbandinganView()
    var isImbalTapped : Bool = false
    var isDanaKelolaanTapped : Bool = false
    
    var imbalView = ImbalHasilViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSafeBackground(top: .white, bottom: .white)
        self.addViewPerbanding()
        self.isImbalTapped = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isImbalTapped {
            setImbalMenu()
        }
    }
    fileprivate func addViewPerbanding() {
        if #available(iOS 11, *){
            perbandingView = PerbandinganView(frame: self.view.safeAreaLayoutGuide.layoutFrame)
        } else {
            perbandingView = PerbandinganView(frame: CGRect(x: 0, y: getStatusBarHeight(), width: self.view.frame.size.width, height: self.view.frame.size.height-self.getStatusBarHeight()))
        }
        
        perbandingView.segment1.addTarget(self, action: #selector(imbalMenu(_:)), for: .touchUpInside)
        perbandingView.segment2.addTarget(self, action: #selector(danaMenu(_:)), for: .touchUpInside)
        self.view.addSubview(perbandingView)
    }
    
    @objc fileprivate func imbalMenu(_ sender: UIButton) {
        isImbalTapped = true
        isDanaKelolaanTapped = false
        self.setImbalMenu()
        self.changeSegmenMenu(Imbal: isImbalTapped, Dana: isDanaKelolaanTapped)
    }
    
    @objc fileprivate func danaMenu(_ sender: UIButton) {
        isImbalTapped = false
        isDanaKelolaanTapped = true
        self.changeSegmenMenu(Imbal: isImbalTapped, Dana: isDanaKelolaanTapped)
    }
    
    fileprivate func changeSegmenMenu(Imbal: Bool, Dana: Bool) {
        perbandingView.segment1.setTitleColor(Imbal ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : UIColor.gray, for: .normal)
        perbandingView.segmentLine1.backgroundColor = Imbal ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : .white
        
        perbandingView.segment2.setTitleColor(Dana ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : UIColor.gray, for: .normal)
        perbandingView.segmentLine2.backgroundColor = Dana ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : .white
    }
    
    fileprivate func setImbalMenu() {
        perbandingView.contentContainer.addSubview(imbalView.view)
        self.addChild(imbalView)
        imbalView.didMove(toParent: self)
    }
    
    fileprivate func setDanaMenu() {
        
    }
}
