//
//  PerbandinganView.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import UIKit

class PerbandinganView: UIView {
    var isImbalHasilTapped: Bool?
    var isDanaTapped: Bool?
    
    var navButton = UIButton()
    var navLabel = UILabel()
    var homeContainer = UIView()
    var navContainer = UIView()
    var menuSwitch = UIView()
    var contentScrollView = UIScrollView()
    var contentDanaScrollView = UIScrollView()
    var segment1 = UIButton()
    var segment2 = UIButton()
    let segmentLine1 = UIView()
    let segmentLine2 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.setViewPerbandi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setViewPerbandi() {
    
        homeContainer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(homeContainer)
        homeContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        homeContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        homeContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        homeContainer.heightAnchor.constraint(equalToConstant: Constants.screenHeight*0.13).isActive = true
        homeContainer.backgroundColor = .white
        homeContainer.layer.shadowColor = UIColor.lightGray.cgColor
        homeContainer.layer.shadowOffset = .init(width: 0, height: homeContainer.frame.size.height*0.7)
        homeContainer.layer.shadowOpacity = 0.7
        homeContainer.layer.shadowRadius = 10
        
        navContainer.translatesAutoresizingMaskIntoConstraints = false
        homeContainer.addSubview(navContainer)
        navContainer.leadingAnchor.constraint(equalTo: homeContainer.leadingAnchor, constant: 0).isActive = true
        navContainer.topAnchor.constraint(equalTo: homeContainer.topAnchor, constant: 30).isActive = true
        navContainer.trailingAnchor.constraint(equalTo: homeContainer.trailingAnchor, constant: 0).isActive = true
        navContainer.heightAnchor.constraint(equalToConstant: Constants.screenHeight*0.07).isActive = true
        navContainer.backgroundColor = .clear
        
        navButton.translatesAutoresizingMaskIntoConstraints = false
        navContainer.addSubview(navButton)
        navButton.centerYAnchor.constraint(equalTo: navContainer.centerYAnchor).isActive = true
        navButton.leadingAnchor.constraint(equalTo: navContainer.leadingAnchor, constant: Constants.screenWidth*0.04).isActive = true
        navButton.heightAnchor.constraint(equalToConstant: Constants.screenHeight*0.05).isActive = true
        navButton.widthAnchor.constraint(equalToConstant: Constants.screenHeight*0.05).isActive = true
        navButton.backgroundColor = .clear
        navButton.setImage(UIImage(named: "back"), for: .normal)
        navButton.imageEdgeInsets = UIEdgeInsets(top: Constants.screenHeight*0.01, left: 0, bottom: Constants.screenHeight*0.01, right: Constants.screenHeight*0.02)
        
        navLabel.translatesAutoresizingMaskIntoConstraints = false
        navContainer.addSubview(navLabel)
        navLabel.leadingAnchor.constraint(equalTo: navButton.trailingAnchor, constant: 0).isActive = true
        navLabel.centerYAnchor.constraint(equalTo: navContainer.centerYAnchor).isActive = true
        navLabel.heightAnchor.constraint(equalToConstant: Constants.screenWidth*0.1).isActive = true
        navLabel.numberOfLines = 2
        navLabel.font.withSize(16)
        navLabel.textAlignment = .left
        navLabel.font = .systemFont(ofSize: 18, weight: .bold)
        navLabel.text = "Perbandingan"
        
        menuSwitch.translatesAutoresizingMaskIntoConstraints = false
        homeContainer.addSubview(menuSwitch)
        menuSwitch.topAnchor.constraint(equalTo: navContainer.bottomAnchor, constant:0).isActive = true
        menuSwitch.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        menuSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        menuSwitch.heightAnchor.constraint(equalToConstant: Constants.screenHeight*0.06).isActive = true
        menuSwitch.backgroundColor = .white
        
        segment1.translatesAutoresizingMaskIntoConstraints = false
        menuSwitch.addSubview(segment1)
        segment1.topAnchor.constraint(equalTo: navContainer.bottomAnchor, constant: 0).isActive = true
        segment1.leadingAnchor.constraint(equalTo: menuSwitch.leadingAnchor, constant: 0).isActive = true
        segment1.bottomAnchor.constraint(equalTo: menuSwitch.bottomAnchor, constant: -4).isActive = true
        segment1.widthAnchor.constraint(equalToConstant: Constants.screenWidth*0.5).isActive = true
        segment1.setTitle(NSLocalizedString("Imbal Hasil", comment: ""), for: .normal)
        segment1.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        segment1.setTitleColor(isImbalHasilTapped ?? true ? Constants.greenTitle : UIColor.gray, for: .normal)
        segment1.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 8)
        segment1.isEnabled = true
        
        segmentLine1.translatesAutoresizingMaskIntoConstraints = false
        menuSwitch.addSubview(segmentLine1)
        segmentLine1.leadingAnchor.constraint(equalTo: menuSwitch.leadingAnchor, constant: 10).isActive = true
        segmentLine1.centerYAnchor.constraint(equalTo: segment1.bottomAnchor).isActive = true
        segmentLine1.heightAnchor.constraint(equalToConstant: 4).isActive = true
        segmentLine1.widthAnchor.constraint(equalToConstant: Constants.screenWidth*0.5).isActive = true
        segmentLine1.backgroundColor = isImbalHasilTapped ?? true ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : .white
        
        segment2.translatesAutoresizingMaskIntoConstraints = false
        menuSwitch.addSubview(segment2)
        segment2.topAnchor.constraint(equalTo: navContainer.bottomAnchor, constant:0).isActive = true
        segment2.leadingAnchor.constraint(equalTo: segment1.trailingAnchor, constant: 0).isActive = true
        segment2.bottomAnchor.constraint(equalTo: menuSwitch.bottomAnchor, constant: -4).isActive = true
        segment2.widthAnchor.constraint(equalToConstant: Constants.screenWidth*0.5).isActive = true
        segment2.setTitle(NSLocalizedString("Dana Kelolaan", comment: ""), for: .normal)
        segment2.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        segment2.setTitleColor(isDanaTapped ?? false ? Constants.greenTitle : UIColor.gray, for: .normal)
        segment2.addBorder(side: .Top, color: .red, width: 2)
        
        segmentLine2.translatesAutoresizingMaskIntoConstraints = false
        menuSwitch.addSubview(segmentLine2)
        segmentLine2.leadingAnchor.constraint(equalTo: segment1.trailingAnchor, constant: 0).isActive = true
        segmentLine2.trailingAnchor.constraint(equalTo: segment2.trailingAnchor, constant: -10).isActive = true
        segmentLine2.centerYAnchor.constraint(equalTo: segment2.bottomAnchor).isActive = true
        segmentLine2.widthAnchor.constraint(equalToConstant: Constants.screenWidth*0.5).isActive = true
        segmentLine2.heightAnchor.constraint(equalToConstant: 4).isActive = true
        segmentLine2.backgroundColor = isDanaTapped ?? false ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : .white
        
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentScrollView)
        contentScrollView.topAnchor.constraint(equalTo: menuSwitch.bottomAnchor, constant: 0).isActive = true
        contentScrollView.widthAnchor.constraint(equalToConstant: Constants.screenWidth).isActive = true
        contentScrollView.heightAnchor.constraint(equalToConstant: Constants.screenHeight).isActive = true
        contentScrollView.backgroundColor = .white
        contentScrollView.contentSize = CGSize(width: 0, height: Constants.screenHeight * 1.05)
        contentScrollView.isHidden = false
        
        contentDanaScrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentDanaScrollView)
        contentDanaScrollView.topAnchor.constraint(equalTo: menuSwitch.bottomAnchor, constant: 0).isActive = true
        contentDanaScrollView.widthAnchor.constraint(equalToConstant: Constants.screenWidth).isActive = true
        contentDanaScrollView.heightAnchor.constraint(equalToConstant: Constants.screenHeight).isActive = true
        contentDanaScrollView.backgroundColor = .white
        contentDanaScrollView.contentSize = CGSize(width: 0, height: Constants.screenHeight * 1.05)
        contentDanaScrollView.isHidden = true

    }
    
}
