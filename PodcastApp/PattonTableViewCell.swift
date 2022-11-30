//
//  PattonTableViewCell.swift
//  PodcastApp
//
//  Created by Евгений Буракевич on 3.05.22.
//

import UIKit

class PattonTableViewCell: UITableViewCell {
    private let dateLabel = UILabel()
    private let nameLabel = UILabel()
    private let autorLabel = UILabel()
    private let durationLabel = UILabel()
    private let imagePodcast = UIImageView(image: UIImage(named: "patton"))
    private let containerView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        
        addSubviews()
        setupConstraints()
        configureContainer()
       
        dateLabel.text = "Feb 18, 2021"
               nameLabel.text = "Conan O’Brien Needs A Friend"
               autorLabel.text = "Patton Oswalt"
               durationLabel.text = "54 min"

        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [containerView, dateLabel, nameLabel, autorLabel, durationLabel, imagePodcast].forEach { subview in
            contentView.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    private func setupConstraints() {
        setupDate()
        setupName()
        setupAutor()
        setupDuration()
        setupImage()
        setupContainer()
      
  
    }
    
    
    private func configureContainer() {
        containerView.addSubview(dateLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(durationLabel)
        containerView.addSubview(autorLabel)
        containerView.addSubview(imagePodcast)
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        autorLabel.translatesAutoresizingMaskIntoConstraints = false
        imagePodcast.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupDate() {
        let topConst = NSLayoutConstraint(
            item: dateLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .top,
            multiplier: 1,
            constant: 12)
        let leadingConst = NSLayoutConstraint(
            item: dateLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .leading,
            multiplier: 1,
            constant: 102)
        topConst.isActive = true
        leadingConst.isActive = true
    }
    private func setupName() {
        let topConst = NSLayoutConstraint(
            item: nameLabel,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0)
        let leadingConst = NSLayoutConstraint(
            item: nameLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .leading,
            multiplier: 1,
            constant: 102)
        topConst.isActive = true
        leadingConst.isActive = true
    }
    private func setupAutor() {
        let topConst = NSLayoutConstraint(
            item: autorLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .bottom,
            multiplier: 1,
            constant: -19)
        let leadingConst = NSLayoutConstraint(
            item: autorLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .leading,
            multiplier: 1,
            constant: 102)
        topConst.isActive = true
        leadingConst.isActive = true
    }
    private func setupDuration() {
        let topConst = NSLayoutConstraint(
            item: durationLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .top,
            multiplier: 1,
            constant: 12)
        let leadingConst = NSLayoutConstraint(
            item: durationLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .trailing,
            multiplier: 1,
            constant: -12)
        topConst.isActive = true
        leadingConst.isActive = true
    }
    private func setupImage() {
        let topConst = NSLayoutConstraint(
            item: imagePodcast,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0)
        let leadingConst = NSLayoutConstraint(
            item: imagePodcast,
            attribute: .leading,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .leading,
            multiplier: 1,
            constant: 12)
        topConst.isActive = true
        leadingConst.isActive = true
    }
    private func setupContainer() {
        let topConst = NSLayoutConstraint(
            item: containerView,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1,
            constant: 0)
        let leadingConst = NSLayoutConstraint(
            item: containerView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leading,
            multiplier: 1,
            constant: 16)
        let trailingConst = NSLayoutConstraint(
            item: containerView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .trailing,
            multiplier: 1,
            constant: -16)
        let botomConst = NSLayoutConstraint(
            item: containerView,
            attribute: .height,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .height,
            multiplier: 1,
            constant: 102)
        botomConst.isActive = true
        trailingConst.isActive = true
        topConst.isActive = true
        leadingConst.isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
