//
//  Baverages.swift
//  Beverages
//
//  Created by praksa on 1.11.22..
//

import Foundation

protocol Baverages {
    
    var name: String { get set }
    var imageName: String { get set }
    var ingredients: [String] { get set }
    var borderColor: String { get set }
    var baverageType: BaverageType { get set }
    
}
