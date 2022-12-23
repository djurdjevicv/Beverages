//
//  Coffee.swift
//  Beverages
//
//  Created by praksa on 31.10.22..
//

import Foundation

struct Coffee: Baverages {

    var name: String
    
    var imageName: String
    
    var ingredients: [String]
    
    var borderColor: String
    
    var baverageType: BaverageType
    
    init(name: String, imageName: String, ingredients: [String], borderColor: String, baverageType: BaverageType) {
        self.name = name
        self.imageName = imageName
        self.ingredients = ingredients
        self.borderColor = borderColor
        self.baverageType = baverageType
    }
    
    

    
    
}
