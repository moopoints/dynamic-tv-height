//
//  TokenCell.swift
//  dynamic-tv-height
//
//  Created by Jan Senderek on 10/9/19.
//  Copyright © 2019 Jan Senderek. All rights reserved.
//

import UIKit

class TokenCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        layer.cornerRadius = 2
        backgroundColor = .darkGray
        addSubview(tokenLabel)
        tokenLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tokenLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    let tokenLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}
