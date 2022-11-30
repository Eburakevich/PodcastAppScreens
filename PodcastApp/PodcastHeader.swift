//
//  PodcastHeader.swift
//  PodcastApp
//
//  Created by Евгений Буракевич on 3.05.22.
//

import UIKit

final class PodcastHeader: UIView {


    private let headerLabel = UILabel()
   private let buttom = UIButton()

    var title: String? {
        get { headerLabel.text }
        set { headerLabel.text = newValue }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}
private extension PodcastHeader {
    func setupUI() {
        addSubviews()
        configureLabel()
        setupConstraintsHeader()
        setupConstraintsButtom()
        configureButton()
        configureButton()
        backgroundColor = .white
    }
    func addSubviews() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        buttom.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerLabel)
        addSubview(buttom)
    }
    func setupConstraintsHeader() {
        let topConstraint = NSLayoutConstraint(
            item: headerLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(
            item: headerLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16)
        let bottomConstraint = NSLayoutConstraint(
            item: headerLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -16)
        
        [leadingConstraint, bottomConstraint, topConstraint].forEach { $0.isActive = true }
        
    }
    
    func setupConstraintsButtom() {
        let topConstraint = NSLayoutConstraint(
            item: buttom, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
      
        let trailingConstraint = NSLayoutConstraint(
            item: buttom, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -16)
        
        [trailingConstraint, topConstraint].forEach { $0.isActive = true }
        
    }
    
    func configureLabel() {
        headerLabel.numberOfLines = 1
        headerLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        headerLabel.font = UIFont(name: "Futura-Bold", size: 26)
    }
    func configureButton() {
        buttom.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        buttom.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        buttom.titleLabel?.font = UIFont(name: "Roboto", size: 16)
        buttom.setTitle("more", for: .normal)
    }
}
