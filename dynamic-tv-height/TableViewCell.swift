//
//  DynaCell.swift
//  dynamic-cv-height
//
//  Created by Jan Senderek on 10/9/19.
//  Copyright © 2019 Jan Senderek. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var data = MyData() { didSet { titleLabel.text = data.title }}
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with data: MyData) {
        self.data = data
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
        self.data.collectionViewHeight = self.collectionView.intrinsicContentSize.height
        print("tableViewCell, collectionView.intrinsicContentSize.height = ", self.collectionView.intrinsicContentSize.height)
    }
    
    func setupViews() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TokenCell.self, forCellWithReuseIdentifier: "tokenCell")
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        let cv = TokensCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.alwaysBounceHorizontal = false
        cv.alwaysBounceVertical = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
}

extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.tokenStrings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tokenCell", for: indexPath) as! TokenCell
        cell.tokenLabel.text = data.tokenStrings[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = data.tokenStrings[indexPath.item]
        let approximateLabelSize = label.systemLayoutSizeFitting(CGSize(width: CGFloat(Float.greatestFiniteMagnitude), height: CGFloat(Float.greatestFiniteMagnitude)))
        return CGSize(width: approximateLabelSize.width + 8 + 8, height: 28)
    }
    
}





