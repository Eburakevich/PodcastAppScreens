//
//  StartViewController.swift
//  PodcastApp
//
//  Created by Evgeny Burakevich on 5.05.22.
//

import UIKit



class StartViewController: UIViewController, NameUserChancheListening, StartScreenActionResponsible {
    
    var userInfoStart = UserInfo(name: nil)
    
    func nameUserChange(_ text: String) {
        userInfoStart.name = text
        }
    func addButtonDidTup() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        if let controller = controller as? MainViewController {
            controller.userInfo = userInfoStart
            print(controller.userInfo?.name ?? "+")
            navigationController?.pushViewController(controller, animated: true)
        }
    }
        
    private let viewCustom = StartView()
  
    override func loadView() {
        super.loadView()
      
        view = viewCustom
    viewCustom.delegateStart = self
    viewCustom.delegateName = self
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = .init(title: "", style: .plain, target: .none, action: .none)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.viewControllers.remove(at: .zero)
    }


}

    


    
    

    
