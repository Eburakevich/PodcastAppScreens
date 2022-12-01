//
//  LaunchViewController.swift
//  PodcastApp
//
//  Created by Evgeny Burakevich on 13.05.22.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
       
        let startGif = UIImage.gifImageWithName("micGif")
        imageView.image = startGif
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000)) {
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let controller = storyboard.instantiateViewController(withIdentifier: "StartViewController")
            if let controller = controller as? StartViewController{
                self.navigationController?.pushViewController(controller, animated: true)
               
            }
            
        }
        
    }

}
