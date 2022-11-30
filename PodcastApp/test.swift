//
//  test.swift
//  PodcastApp
//
//  Created by Евгений Буракевич on 4.05.22.
//

import Foundation
import UIKit


final class testTableDelegate: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
    
    
    private let customView = MainView()
   
        view = customView
        customView.table2.delegate = self
        customView.table2.dataSource = self
        
    
        customView.table2.separatorStyle = .none
        customView.table2.rowHeight = UITableView.automaticDimension
        customView.table2.register(PodcastTableViewCell.self, forCellReuseIdentifier: "PodcastTableViewCell")
        
       
        view.backgroundColor = .white
  
}
