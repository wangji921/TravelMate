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
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
            iconImageView.tintColor = isHighlighted ? UIColor.white : UIColor.darkGray
            print(isHighlighted)
        }
    }
    var setting: Setting? {
        didSet {
            nameLabel.text = setting?.name
            
            if let imageName = setting?.imageName {
                iconImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                iconImageView.tintColor = UIColor.darkGray
            }
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "settings")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)
        addSubview(iconImageView)
        
//        var labelConstraint: [NSLayoutConstraint] = []
//
//        let topConstraint = nameLabel.topAnchor.constraint(equalTo: self.topAnchor)
//        let bottomConstraint = nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        let leftConstraint = nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
//        let rightConstraint = nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
//
//        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
//        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
//
//        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        nameLabel.heightAnchor.constraint(equalToConstant: 3).isActive = true


//        addConstraint(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: (NSLayoutFormatOptions()), metrics: nil, views: ["nameLabel"]))

        
//        labelConstraint = [topConstraint, bottomConstraint, leftConstraint, rightConstraint]
//
//        NSLayoutConstraint.activate(labelConstraint)
        
//        addConstraint(NSLayoutConstraint(
//            withVisualFormat: "H:|[v0]|",
//            options: .alignAllCenterX,
//            metrics: nil,
//            views: ["label": nameLabel]))
        

//        backgroundColor = UIColor.blue
        
        addConstraintsWithFormat(format: "H:|-8-[v0(30)]-8-[v1]|", views: iconImageView, nameLabel)
        
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
        
        addConstraintsWithFormat(format: "V:|-10-[v0(30)]|", views: iconImageView)
        
//        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
//        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy:  .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
//        var image: [NSLayoutConstraint] = []
//        image = [NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)]
//        NSLayoutConstraint.activate(image)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
