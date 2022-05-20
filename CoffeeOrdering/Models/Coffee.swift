//
//  Coffee.swift
//  CoffeeOrdering
//
//  Created by adam janusewski on 5/19/22.
//

import Foundation

struct Coffee {
    let name: String
    let imageURL: String
    let price: Double
    
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageURL: "Capp", price: 2.5),
            Coffee(name: "Espresso", imageURL: "Expresso", price: 2.1),
            Coffee(name: "Regular", imageURL: "Coffee", price: 1.0)
        ]
    }
}
