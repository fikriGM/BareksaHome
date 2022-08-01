//
//  ImbalCollectionViewCell.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/31/22.
//

import UIKit

class ImbalCollectionViewCell: UICollectionViewCell {
    
  
    private var labelName = UIButton()
    
    private var labelJenis = UILabel()
    private var jenis = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelName)
        labelName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        labelName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        labelName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        labelName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        labelName.widthAnchor.constraint(equalToConstant: 40).isActive = true
        labelName.titleLabel?.numberOfLines = 3
        labelName.titleLabel?.lineBreakMode = .byCharWrapping
        labelName.titleLabel?.textAlignment = .center
        labelName.layer.cornerRadius = 10
        labelName.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        labelName.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        jenis.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(jenis)
        jenis.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 400).isActive = true
        jenis.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        jenis.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        jenis.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        jenis.heightAnchor.constraint(equalToConstant: 40).isActive = true
        jenis.widthAnchor.constraint(equalToConstant: 40).isActive = true
        jenis.titleLabel?.numberOfLines = 3
        jenis.titleLabel?.lineBreakMode = .byCharWrapping
        jenis.titleLabel?.textAlignment = .center
        jenis.layer.cornerRadius = 10
        jenis.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        jenis.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
       
    }
    
    
    func setData(str: ImbalHasilEntity) {
        if str.name.contains("BNI-AM") {
            labelName.backgroundColor = #colorLiteral(red: 0.3570777178, green: 0.6305412054, blue: 0.1846453547, alpha: 1)
        }else if str.name.contains("Cipta Dana") {
            labelName.backgroundColor = #colorLiteral(red: 0.5196995139, green: 0.3309294879, blue: 0.9096059203, alpha: 1)
        }else if str.name.contains("Avrist Equity") {
            labelName.backgroundColor = #colorLiteral(red: 0.2336512804, green: 0.6921926141, blue: 0.896081686, alpha: 1)
        }
        labelName.setTitle(str.name, for: .normal)
    }
}
