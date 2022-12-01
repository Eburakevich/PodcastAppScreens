//
//  StartView.swift
//  PodcastApp
//
//  Created by Evgeny Burakevich on 5.05.22.
//
import Foundation

import UIKit

protocol NameUserChancheListening: AnyObject {
    func nameUserChange(_ text: String)
}
protocol StartScreenActionResponsible: AnyObject {
    func addButtonDidTap()
}

class StartView: UIView {
    
    weak var delegateName: NameUserChancheListening?
    weak var delegateStart: StartScreenActionResponsible?
    private let mainLabel = UILabel()
    private let buttonImage = UIImageView()
    private let buttonStarted = UIButton()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        preconFigureSubviews()
        setupConstraints()
        configureStartButton()
        configureButtonImage()
        configureMainLabel()
        configureNme()
      mainLabel.text = "Listen to Your Favorite Comedians"
      buttonImage.image = UIImage(named: "button")
    }
    
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    private func addSubviews() {
        addSubview(mainLabel)
        addSubview(buttonImage)
        addSubview(buttonStarted)
        addSubview(nameUser)
        
    }
    private func preconFigureSubviews() {
        subviews.forEach{ element in element.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupConstraints() {
        setupMainLabel()
        setupButtonImage()
        setupButton()
        setupName()
        
   
    }
    private func setupName() {
        nameUser.bottomAnchor.constraint(equalTo: buttonImage.topAnchor, constant: -136).isActive = true
        nameUser.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
    }
    private func setupMainLabel() {
        mainLabel.bottomAnchor.constraint(equalTo: buttonImage.topAnchor, constant: -212).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        mainLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
    }
    private func setupButtonImage() {
        
        buttonImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -66).isActive = true
        buttonImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        buttonImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        buttonImage.heightAnchor.constraint(equalToConstant: 144).isActive = true
    }
    private func setupButton() {
        buttonStarted.bottomAnchor.constraint(equalTo: buttonImage.bottomAnchor, constant: -32).isActive = true
        buttonStarted.centerXAnchor.constraint(equalTo: buttonImage.centerXAnchor, constant: 0).isActive = true
    }
    
    
    let nameUser = UITextField()
    private func configureNme() {
        nameUser.placeholder = "enter user name"
        nameUser.textColor = .darkGray
        nameUser.font = UIFont(name: "Roboto-Medium", size: 24)
        nameUser.addTarget(self, action: #selector(nameDidEnd), for: .primaryActionTriggered)
        nameUser.addTarget(self, action: #selector(nameDidChange), for: .editingChanged)
      
    }
    @objc func nameDidChange(_ sender: UITextField) {
        delegateName?.nameUserChange(sender.text ?? "")
    }
    @objc private func nameDidEnd() {
        nameUser.endEditing(true)
    }
  
    
    private func configureStartButton() {
       buttonStarted.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 1) , for: .normal)
        buttonStarted.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 0.6) , for: .highlighted)
        buttonStarted.setTitle("Get started", for: .normal)
        buttonStarted.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 24)
        buttonStarted.addTarget(self, action: #selector(addButtonDidTap), for: .touchUpInside)
    }
    @objc private func addButtonDidTap() {
        delegateStart?.addButtonDidTap()
    }
    private func configureButtonImage () {
            buttonImage.tintColor = .black
        }
    private func configureMainLabel() {
        mainLabel.numberOfLines = 4
        mainLabel.textAlignment = .left
        mainLabel.font = UIFont(name: "Futura-Bold", size: 48)
        mainLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


}
