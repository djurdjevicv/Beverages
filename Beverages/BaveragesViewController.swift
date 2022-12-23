//
//  BaveragesViewController.swift
//  Beverages
//
//  Created by praksa on 1.11.22..
//

import UIKit


class BaveragesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableView: UITableView!
    
    var filter: BaverageType = .all
    
    @IBAction func filterAll(_ sender: Any) {
        filter = .all
        tableView.reloadData()
    }
    
    @IBAction func filterCoffee(_ sender: Any) {
        filter = .coffee
        tableView.reloadData()
    }
    
    @IBAction func filterTea(_ sender: Any) {
        filter = .tea
        tableView.reloadData()
    }
    
    @IBAction func filterCocktail(_ sender: Any) {
        filter = .cocktail
        tableView.reloadData()
    }
    
    let listOfCoffee: [Coffee] = [
        Coffee(name: "Esspresso", imageName: AppImage.espresso.description, ingredients: ["short espresso"], borderColor: "redColor", baverageType: .coffee),
        Coffee(name: "Americano", imageName: AppImage.americano.description, ingredients: ["short espresso","hot water"], borderColor: "asparagusColor", baverageType: .coffee),
        Coffee(name: "Frappe", imageName: AppImage.frappe.description, ingredients: ["short espresso","ice","milk"], borderColor: "brownColor", baverageType: .coffee),
        Coffee(name: "Cappuccino", imageName: AppImage.cappuccino.description, ingredients: ["short espresso","steamed milk","milk foam"], borderColor: "blueColor", baverageType: .coffee)
    ]
    
    let listOfTea: [Tea] = [
        Tea(name: "Ginger", imageName: AppImage.gigner.description, ingredients: ["ginger","honey"], borderColor: "yellowColor", baverageType: .tea),
        Tea(name: "Peppermint", imageName: AppImage.peppermint.description, ingredients: ["peppermint","honey"], borderColor: "cayenneColor", baverageType: .tea),
        Tea(name: "Camomile", imageName: AppImage.camomile.description, ingredients: ["camomile","honey"], borderColor: "cyanColor", baverageType: .tea),
        Tea(name: "Black", imageName: AppImage.black.description, ingredients: ["black","honey"], borderColor: "greenColor", baverageType: .tea)
    ]
    
    let listOfCocktail: [Cocktail] = [
        Cocktail(name: "Mojito", imageName: AppImage.mojito.description, ingredients: ["Juice of 1 lime","1 tsp granulated sugar", "Small handful mint leaves", "60ml white rum", "soda water"], borderColor: "ironColor", baverageType: .cocktail),
        Cocktail(name: "Bacardi", imageName: AppImage.bacardi.description, ingredients: ["Rum","Lime","Grenadine"], borderColor: "magentaColor", baverageType: .cocktail),
        Cocktail(name: "B-52", imageName: AppImage.b52.description, ingredients: ["Coffee liqueur (usually Kahlua)", "Irish cream (usually Baileys)", "Orange liqueur (usually Grand Marnier)"], borderColor: "orangeColor", baverageType: .cocktail),
        Cocktail(name: "Manhattan", imageName: AppImage.manhattan.description, ingredients: ["2 ounces* bourbon or rye whiskey", "1 ounce sweet red vermouth", "3 dashes Angostura or orange bitters", "Luxardo cherry, for garnish"], borderColor: "purpleColor", baverageType: .cocktail)
    ]
    
    var listOfBaverages: [Baverages] = []
    var filteredList: [Baverages] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOfBaverages = listOfCoffee + listOfTea + listOfCocktail
                
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch filter {
        case .all:
            return listOfBaverages.count
        case .tea:
            filteredList = listOfBaverages.filter { baverage in
            return baverage is Tea
        }
            return filteredList.count
        case .coffee:
            filteredList = listOfBaverages.filter { baverage in
            return baverage is Coffee
        }
            return filteredList.count
        case .cocktail:
            filteredList = listOfBaverages.filter { baverage in
            return baverage is Cocktail
        }
            return filteredList.count
        }

    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "baverageCell", for: indexPath) as! BaverageTableViewCell
        
        if filter == .all {
            let baverage: Baverages = listOfBaverages[indexPath.row]
            setValueIntoCell(cell: cell, baverage: baverage)
        }else {
            let baverage: Baverages = filteredList[indexPath.row]
            setValueIntoCell(cell: cell, baverage: baverage)
        }
        
        return cell
    }
    
    func setValueIntoCell(cell: BaverageTableViewCell, baverage: Baverages){
        cell.label.text = baverage.name
        cell.iconImageView.image = UIImage(named: baverage.imageName)
        cell.layer.borderColor = UIColor(named: baverage.borderColor)?.cgColor
        cell.layer.borderWidth = 1
        cell.isUserInteractionEnabled = true
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        if let vc = storyboard.instantiateViewController(withIdentifier: "BaverageDetailViewController") as? BaverageDetailViewController {
            if filter == .all{
                vc.item = listOfBaverages[indexPath.row]
            }else {
                vc.item = filteredList[indexPath.row]
            }
            self.present(vc, animated: true, completion: nil);
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    

    

}

