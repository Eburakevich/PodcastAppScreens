//
//  MainView.swift
//  PodcastApp
//
//  Created by Evgeny Burakevich on 3.05.22.
//
import Foundation

import UIKit

final class MainView: UIView {
   weak var delegate: MainScreenActionResponsible?
   weak var seeAllBottonDelegate: seeAllLinkDelegate?
    
 let headerLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let tabBarView = UIView()
    private let userImage = UIImageView()
    private let imageScroll = UIScrollView()
    private let imageStackViews = UIStackView()
    private let newEpisode = UILabel()
    private let popularButton = UIButton()
    private let recent = UIButton()
    private let featured = UIButton()
    private let trending = UIButton()
    private let tabBarStackView = UIStackView()
    private let homeButton = UIButton()
    private let searchButton = UIButton()
    private let likeButton = UIButton()
    private let profileButton = UIButton()
    let table2 = UITableView(frame: .zero, style: .plain)
    private let billburr = UIImageView()
    private let comedians = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        preconFigureSubviews()
        configureHeader()
        configureDescription()
        setupConstraints()
        configureRecentButton()
        configureFeaturedButton()
        configureTrendingButton()
        configurePopuparButton()
        configureTupBar()
        configureHome()
        configureSearch()
        configureLike()
        configureProfile()
        configureTabBarButton()
        configureGestures()
        configureGesturesImage()
        descriptionLabel.text = "Discover New Podcast"
        userImage.image = UIImage(named: "userImage")
        billburr.image = UIImage(named: "billburr")
        comedians.image = UIImage(named: "comedians")
        headerLabel.text = "Hi, User"
        userImage.isUserInteractionEnabled = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        headerLabel.isUserInteractionEnabled = true
    }
    
    private func configureGestures() {
        let tapGestureLong = UILongPressGestureRecognizer(target: self, action: #selector(headerLongDidTap))
        headerLabel.addGestureRecognizer(tapGestureLong)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerDidTap))
        headerLabel.addGestureRecognizer(tapGesture)
    }
    @objc private func headerLongDidTap(_ gesture: UILongPressGestureRecognizer) {
        headerLabel.trailingAnchor.constraint(equalTo: userImage.leadingAnchor, constant: -12).isActive = true
    }
    @objc private func headerDidTap(_ gesture: UITapGestureRecognizer) {
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    private func addSubviews() {
        addSubview(headerLabel)
        addSubview(descriptionLabel)
        addSubview(userImage)
        addSubview(popularButton)
        addSubview(recent)
        addSubview(featured)
        addSubview(trending)
        addSubview(imageStackViews)
        addSubview(tabBarView)
        addSubview(tabBarStackView)
        addSubview(table2)
        addSubview(billburr)
        addSubview(comedians)
    }
    private func preconFigureSubviews() {
        subviews.forEach{ element in element.translatesAutoresizingMaskIntoConstraints = false }
    }
    private func setupConstraints() {
        setupHeaderLabel()
        setupDescriptionLabel()
        setupUserImageConstraint()
        setupPopular()
        setupRecent()
        setupFeatured()
        setupTrending()
        setupTupBar()
        setupTupBarButtons()
        setupTable2()
        comicsConstraint()
        billburrConstraint()
    }
    
    private func setupTable2() {
        let TopConstraint = NSLayoutConstraint(
        item: table2,
        attribute: .top,
        relatedBy: .equal,
        toItem: descriptionLabel,
        attribute: .bottom,
        multiplier: 1,
        constant: 260)
        let leadingConstraint = NSLayoutConstraint(
        item: table2,
        attribute: .leading,
        relatedBy: .equal,
        toItem: self,
        attribute: .leading,
        multiplier: 1,
        constant: 0)
        let trailingConstraint = NSLayoutConstraint(
        item: table2,
        attribute: .trailing,
        relatedBy: .equal,
        toItem: self,
        attribute: .trailing,
        multiplier: 1,
        constant: 0)
        let botomConstraint = NSLayoutConstraint(
        item: table2,
        attribute: .bottom,
        relatedBy: .equal,
        toItem: tabBarView,
        attribute: .top,
        multiplier: 1,
        constant: 0)
        botomConstraint.isActive = true
        trailingConstraint.isActive = true
        TopConstraint.isActive = true
        leadingConstraint.isActive = true
    }
   
    private func setupTrending() {
            let TopConstraint = NSLayoutConstraint(
                item: trending,
                attribute: .top,
                relatedBy: .equal,
                toItem: self,
                attribute: .topMargin,
                multiplier: 1,
                constant: 131)
            let leadingConstraint = NSLayoutConstraint(
                item: trending,
                attribute: .leading,
                relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1,
            constant: 285)
            let heightConstraint = NSLayoutConstraint(
                item: trending,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 37)
            heightConstraint.isActive = true
            let widhtConstraint = NSLayoutConstraint(
                item: trending,
                attribute: .width,
                relatedBy: .equal,
                toItem: .none,
                attribute: .width,
                multiplier: 1,
                constant: 80)
            widhtConstraint.isActive = true
        TopConstraint.isActive = true
        leadingConstraint.isActive = true
    }
    private func setupFeatured() {
            let TopConstraint = NSLayoutConstraint(
                item: featured,
                attribute: .top,
                relatedBy: .equal,
                toItem: self,
                attribute: .topMargin,
                multiplier: 1,
                constant: 131)
            let leadingConstraint = NSLayoutConstraint(
                item: featured,
                attribute: .leading,
                relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1,
            constant: 195)
            let heightConstraint = NSLayoutConstraint(
                item: featured,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 37)
            heightConstraint.isActive = true
            let widhtConstraint = NSLayoutConstraint(
                item: featured,
                attribute: .width,
                relatedBy: .equal,
                toItem: .none,
                attribute: .width,
                multiplier: 1,
                constant: 80)
            widhtConstraint.isActive = true
        TopConstraint.isActive = true
        leadingConstraint.isActive = true
    }
    private func setupRecent() {
            let TopConstraint = NSLayoutConstraint(
                item: recent,
                attribute: .top,
                relatedBy: .equal,
                toItem: self,
                attribute: .topMargin,
                multiplier: 1,
                constant: 131)
            let leadingConstraint = NSLayoutConstraint(
                item: recent,
                attribute: .leading,
                relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1,
            constant: 105)
            let heightConstraint = NSLayoutConstraint(
                item: recent,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 37)
            heightConstraint.isActive = true
            let widhtConstraint = NSLayoutConstraint(
                item: recent,
                attribute: .width,
                relatedBy: .equal,
                toItem: .none,
                attribute: .width,
                multiplier: 1,
                constant: 80)
            widhtConstraint.isActive = true
        TopConstraint.isActive = true
        leadingConstraint.isActive = true
    }
    private func setupTupBarButtons() {
            let TopConstraint = NSLayoutConstraint(
                item: tabBarStackView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: self,
                attribute: .bottom,
                multiplier: 1,
                constant: -56)
            let leadingConstraint = NSLayoutConstraint(
                item: tabBarStackView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: self,
                attribute: .centerX,
                multiplier: 1,
                constant: 0)
        TopConstraint.isActive = true
        leadingConstraint.isActive = true
    }
    private func setupTupBar() {
        let TopConstraint = NSLayoutConstraint(
            item: tabBarView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1,
            constant: -34)
        let leadingConstraint = NSLayoutConstraint(
            item: tabBarView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)
            let heightConstraint = NSLayoutConstraint(
                item: tabBarView,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 64)
        let widgtConstraint = NSLayoutConstraint(
            item: tabBarView,
            attribute: .width,
            relatedBy: .equal,
            toItem: .none,
            attribute: .width,
            multiplier: 1,
            constant: 360)
        widgtConstraint.isActive = true
        heightConstraint.isActive = true
        TopConstraint.isActive = true
        leadingConstraint.isActive = true
    }
    private func setupPopular() {
        let TopConstraint = NSLayoutConstraint(
            item: popularButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .topMargin,
            multiplier: 1,
            constant: 131)
        let leadingConstraint = NSLayoutConstraint(
            item: popularButton,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1,
            constant: 16)
            let heightConstraint = NSLayoutConstraint(
                item: popularButton,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 37)
            heightConstraint.isActive = true
            let widhtConstraint = NSLayoutConstraint(
                item: popularButton,
                attribute: .width,
                relatedBy: .equal,
                toItem: .none,
                attribute: .width,
                multiplier: 1,
                constant: 80)
            widhtConstraint.isActive = true
        TopConstraint.isActive = true
        leadingConstraint.isActive = true
    }
    
   private func configureGesturesImage() {
        let tapGestureLong = UILongPressGestureRecognizer(target: self, action: #selector(imageLongDidTap))
        userImage.addGestureRecognizer(tapGestureLong)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageDidTap))
        userImage.addGestureRecognizer(tapGesture)
    }
    @objc private func imageLongDidTap(_ gesture: UILongPressGestureRecognizer) {
        userImage.heightAnchor.constraint(equalToConstant: 124).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 124).isActive = true
    }
    @objc private func imageDidTap(_ gesture: UITapGestureRecognizer) {
        userImage.heightAnchor.constraint(equalToConstant: 62).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 62).isActive = true
    }
    
    private func setupUserImageConstraint() {
        let topImage = NSLayoutConstraint(
                           item: userImage,
                           attribute: .topMargin,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 12)
        let trailingImage = NSLayoutConstraint(
            item: userImage,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1,
            constant: -16)
        topImage.isActive = true
        trailingImage.isActive = true
    }
        private func setupHeaderLabel() {
        let headertopConstraint = NSLayoutConstraint(
                           item: headerLabel,
                           attribute: .topMargin,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 28)
        headertopConstraint.isActive = true
    }
    private func setupDescriptionLabel() {
        let descriptiontopConstraint = NSLayoutConstraint(
                           item: descriptionLabel,
                           attribute: .topMargin,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 80)
        let descriptionleadingConstraint = NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1,
            constant: 16)
        let trailingDescription = NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .trailingMargin,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -16)
        trailingDescription.isActive = true
        descriptiontopConstraint.isActive = true
        descriptionleadingConstraint.isActive = true
    }
    private func billburrConstraint() {
            let topImage = NSLayoutConstraint(
                               item: billburr,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .topMargin,
                               multiplier: 1,
                               constant: 180)
            let trailingImage = NSLayoutConstraint(
                item: billburr,
                attribute: .leading,
                relatedBy: .equal,
                toItem: self,
                attribute: .leading,
                multiplier: 1,
                constant: 2)
            topImage.isActive = true
            trailingImage.isActive = true
        }
    private func comicsConstraint() {
            let topImage = NSLayoutConstraint(
                               item: comedians,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .topMargin,
                               multiplier: 1,
                               constant: 180)
            let trailingImage = NSLayoutConstraint(
                item: comedians,
                attribute: .leading,
                relatedBy: .equal,
                toItem: billburr,
                attribute: .trailing,
                multiplier: 1,
                constant: -64)
            topImage.isActive = true
            trailingImage.isActive = true
        }

    private func configureImageStackView() {
        imageStackViews.addArrangedSubview(billburr)
        imageStackViews.addArrangedSubview(comedians)
        imageStackViews.axis = .horizontal
        imageStackViews.spacing = 16
    }
    private func configureHeader() {
        headerLabel.isUserInteractionEnabled = true
        headerLabel.numberOfLines = 0
        headerLabel.textAlignment = .left
        headerLabel.font = UIFont(name: "Futura", size: 28)
        headerLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    private func configureDescription() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = UIFont(name: "Futura-Bold", size: 28)
        descriptionLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    private func configureTupBar() {
            tabBarView.backgroundColor = .black
            tabBarView.layer.cornerRadius = 32
        }
    private func configurePopuparButton() {
        popularButton.setTitleColor(UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1), for: .normal)
        popularButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), for: .highlighted)
        popularButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        popularButton.layer.cornerRadius = 20
        popularButton.setTitle("Popular", for: .normal)
        popularButton.titleLabel?.font = UIFont(name: "Roboto", size: 16)
        popularButton.addTarget(self, action: #selector(addPopularButtonDidTup), for: .touchUpInside)
    }
    @objc private func addPopularButtonDidTup() {
        delegate?.addPopularButtonDidTap()
        popularButton.setTitleColor(UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1), for: .normal)
        popularButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), for: .highlighted)
        popularButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        recent.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        recent.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        recent.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        featured.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        featured.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        featured.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        trending.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        trending.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        trending.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
    private func configureRecentButton() {
        recent.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        recent.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        recent.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        recent.layer.cornerRadius = 20
        recent.setTitle("Recent", for: .normal)
        recent.titleLabel?.font = UIFont(name: "Roboto", size: 16)
        recent.addTarget(self, action: #selector(addRecentButtonDidTup), for: .touchUpInside)
    }
    @objc private func addRecentButtonDidTup() {
        delegate?.addRecentButtonDidTap()
        recent.setTitleColor(UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1), for: .normal)
        recent.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), for: .highlighted)
        recent.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        popularButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        popularButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        popularButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        featured.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        featured.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        featured.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        trending.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        trending.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        trending.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
    private func configureFeaturedButton() {
        featured.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        featured.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        featured.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        featured.layer.cornerRadius = 20
        featured.setTitle("Featured", for: .normal)
        featured.titleLabel?.font = UIFont(name: "Roboto", size: 16)
        featured.addTarget(self, action: #selector(addFeaturedButtonDidTup), for: .touchUpInside)
    }
    @objc private func addFeaturedButtonDidTup() {
        delegate?.configureFeaturedButton()
        featured.setTitleColor(UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1), for: .normal)
        featured.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), for: .highlighted)
        featured.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        popularButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        popularButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        popularButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        recent.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        recent.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        recent.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        trending.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        trending.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        trending.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
    private func configureTrendingButton() {
        trending.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        trending.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        trending.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        trending.layer.cornerRadius = 20
        trending.setTitle("Trending", for: .normal)
        trending.titleLabel?.font = UIFont(name: "Roboto", size: 16)
        trending.addTarget(self, action: #selector(addTrendingButtonDidTup), for: .touchUpInside)
    }
    
    @objc private func addTrendingButtonDidTup() {
        delegate?.addTrendingButtonDidTap()
        trending.setTitleColor(UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1), for: .normal)
        trending.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), for: .highlighted)
        trending.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        popularButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        popularButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        popularButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        recent.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        recent.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        recent.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        featured.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
        featured.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
        featured.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
   
    private func configureTabBarButton() {
        tabBarStackView.addArrangedSubview(homeButton)
        tabBarStackView.addArrangedSubview(searchButton)
        tabBarStackView.addArrangedSubview(likeButton)
        tabBarStackView.addArrangedSubview(profileButton)
        tabBarStackView.axis = .horizontal
        tabBarStackView.spacing = 56
    }
    private func configureHome() {
        homeButton.backgroundColor = .clear
        homeButton.setImage(UIImage(named: "home"), for: .normal)
        homeButton.tintColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1)
        homeButton.addTarget(self, action: #selector(addHomeButtonDidTup), for: .touchUpInside)
    }
    @objc private func addHomeButtonDidTup() {
        homeButton.tintColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1)
        searchButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        likeButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        profileButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
}
    private func configureSearch() {
        searchButton.backgroundColor = .clear
        searchButton.setImage(UIImage(named: "search"), for: .normal)
        searchButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        searchButton.addTarget(self, action: #selector(addSearchButtonDidTup), for: .touchUpInside)
    }
    @objc private func addSearchButtonDidTup() {
        searchButton.tintColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1)
        homeButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        likeButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        profileButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
}
    private func configureLike() {
        likeButton.backgroundColor = .clear
        likeButton.setImage(UIImage(named: "heart"), for: .normal)
        likeButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        likeButton.addTarget(self, action: #selector(addLikeButtonDidTup), for: .touchUpInside)
    }
    @objc private func addLikeButtonDidTup() {
        likeButton.tintColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1)
        homeButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        searchButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        profileButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
}
    private func configureProfile() {
        profileButton.backgroundColor = .clear
        profileButton.setImage(UIImage(named: "profil"), for: .normal)
        profileButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        profileButton.addTarget(self, action: #selector(addProfileButtonDidTup), for: .touchUpInside)
    }
    @objc private func addProfileButtonDidTup() {
        profileButton.tintColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1)
        homeButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        searchButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        likeButton.tintColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
}
}


