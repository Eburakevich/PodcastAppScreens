//
//  ViewController.swift
//  PodcastApp
//
//  Created by Евгений Буракевич on 3.05.22.
//

import Foundation
import UIKit

protocol MainScreenActionResponsible: AnyObject {
    
    func addPopularButtonDidTup()
    func addRecentButtonDidTup()
    func configureFeaturedButton()
    func addTrendingButtonDidTup()
    
}
protocol seeAllLinkDelegate: AnyObject {
    func addSeeAllButtonDidTap()
}

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var userInfo: UserInfo?
    
    
    private let podcasts = [PodcastInfo(name: "The Bill Simmons Podcast", date: "Feb 20, 2021", autor: "Ep. 92: Louis C.K.", duration: "1 hr 14 min", image: UIImage(named: "louis")!),
    PodcastInfo(name: "Conan O’Brien Needs A Friend", date: "Feb 18, 2021", autor: "Patton Oswalt", duration: "54 min", image: UIImage(named: "patton")!),
    PodcastInfo(name: "Ask Me Another", date: "Feb 14, 2021", autor: "Marc Maron", duration: "1 hr 18 min", image: UIImage(named: "maron")!)]
     

    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        podcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastTableViewCell") as! PodcastTableViewCell
        cell.update(dataModel: podcasts[indexPath.row])
        
    
        return cell
    }
    
    let customView = MainView()
   
    override func loadView() {
        view = customView
      customView.delegate = self
       
        customView.table2.delegate = self
        customView.table2.dataSource = self
        
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        customView.headerLabel.text = "Hi, \(userInfo?.name ?? "User")"
        customView.table2.separatorStyle = .none
        customView.table2.rowHeight = UITableView.automaticDimension
        customView.table2.register(PodcastTableViewCell.self, forCellReuseIdentifier: "PodcastTableViewCell")
        view.backgroundColor = .white
    }
    
   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = PodcastHeader()
        if section == 0 {
            view.title = "New Episodes"
        }
        return view
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
extension MainViewController: seeAllLinkDelegate {
    
func addSeeAllButtonDidTap() {
    print("ddd")
    present(PodcastTableViewController(), animated: true)
}

}
extension MainViewController: MainScreenActionResponsible {
    
    func addPopularButtonDidTup() {
        print(customView.headerLabel.text ?? "+-")
    }
    
    func addRecentButtonDidTup() {
        print("tap recent button")
       
    }
    func configureFeaturedButton(){
        print("tap featured button")
    }
    func addTrendingButtonDidTup() {
        print("tap trending button")
    }
}


