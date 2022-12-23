//
//  BaverageDetailViewController.swift
//  Beverages
//
//  Created by praksa on 1.11.22..
//

import UIKit

class BaverageDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var item : Baverages = Coffee(name: "", imageName: "", ingredients: [], borderColor: "", baverageType: .all)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        imageView.image = UIImage(named: item.imageName)
        
        itemName.text = item.name
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let detail = item.ingredients[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "baverageDetailsCell", for: indexPath) as? BaverageDetailsTableViewCell
        cell?.label.text = detail

        return cell!
    }
    

}
