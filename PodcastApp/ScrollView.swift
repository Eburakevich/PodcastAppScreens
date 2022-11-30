//
//  ScrollView.swift
//  PodcastApp
//
//  Created by Евгений Буракевич on 3.05.22.
//

import UIKit


final class ScrollView: UIView {
    
        private let containerScrollView = UIScrollView()
        
        private let billburr = UIImageView()
        private let comedians = UIImageView()
        private let twoBeer = UIImageView()

        init() {
            super.init(frame: .zero)
            
            billburr.image = UIImage(named: "billburr")
            comedians.image = UIImage(named: "comedians")
            twoBeer.image = UIImage(named: "twobears")
        




}
required init?(coder: NSCoder) {
fatalError("init(coder:) has not been implemented")
}

}
