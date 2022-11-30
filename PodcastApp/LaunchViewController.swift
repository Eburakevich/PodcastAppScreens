//
//  LaunchViewController.swift
//  PodcastApp
//
//  Created by Евгений Буракевич on 13.05.22.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
