//
//  Order.swift
//  CoffeeOrdering
//
//  Created by adam janusewski on 5/19/22.
//

import Foundation

struct Order: Codable {  //  Needed for Decoding Json
    
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
    
}
