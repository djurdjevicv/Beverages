//
//  AppImage.swift
//  Beverages
//
//  Created by praksa on 1.11.22..
//

import Foundation

enum AppImage: CustomStringConvertible {
    
    //COFFEE
    case espresso
    case americano
    case frappe
    case cappuccino
    
    //TEA
    case gigner
    case black
    case camomile
    case peppermint
    
    //COCKTAIL
    case b52
    case bacardi
    case mojito
    case manhattan
    
    var description: String {
        switch self {
        case .espresso: return "espresso"
        case .americano: return "americano"
        case .frappe: return "frappe"
        case .cappuccino: return "cappuccino"
            
        case .gigner: return "ginger"
        case .black: return "black"
        case .camomile: return "camomile"
        case .peppermint: return "peppermint"
            
        case .b52: return "b52"
        case .bacardi: return "bacardi"
        case .mojito: return "mojito"
        case .manhattan: return "manhattan"
        }
    }
    
}
