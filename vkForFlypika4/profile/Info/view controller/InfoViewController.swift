//
//  InfoViewController.swift
//  vkForFlypika4
//
//  Created by Аида on 4.07.21.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        

    }
}

// Mark
// Mark Table View data source
extension InfoViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! InfoTableViewCell
        
        return cell
    }
    
    
}

// Mark
// Mark Table view delegate
extension InfoViewController : UITableViewDelegate {
    
}
