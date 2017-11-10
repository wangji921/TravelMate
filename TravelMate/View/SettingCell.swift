//
//  setting.swift
//  TravelMate
//
//  Created by Ji Wang on 9/11/17.
//  Copyright © 2017 DingandJi. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SettingCell: BaseCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.textColor = UIColor.yellow
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
//        self.addSubview(nameLabel)
        addSubview(nameLabel)
        
        var labelConstraint: [NSLayoutConstraint] = []
        
        let topConstraint = nameLabel.topAnchor.constraint(equalTo: self.topAnchor)
        let bottomConstraint = nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let leftConstraint = nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let rightConstraint = nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 3).isActive = true



        
//        labelConstraint = [topConstraint, bottomConstraint, leftConstraint, rightConstraint]
//
//        NSLayoutConstraint.activate(labelConstraint)
        
//        addConstraint(NSLayoutConstraint(
//            withVisualFormat: "H:|[v0]|",
//            options: .alignAllCenterX,
//            metrics: nil,
//            views: ["label": nameLabel]))
        

//        backgroundColor = UIColor.blue
    }
}
