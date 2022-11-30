//
//  CollectionViewCell.swift
//  PodcastApp
//
//  Created by Евгений Буракевич on 9.05.22.
//

import UIKit


struct imageCollection {
    let image: UIImage
}


class CollectionViewCell: UICollectionViewCell {
static let reuseID = "CollectionViewCell"
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        return imageView
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainImage)
        mainImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
        
        func updateImage(dataModel: imageCollection) {
            mainImage.image = dataModel.image
        }
        func addSubwiews() {
        addSubview(mainImage)
            mainImage.translatesAutoresizingMaskIntoConstraints = false
        }

    
    
}
