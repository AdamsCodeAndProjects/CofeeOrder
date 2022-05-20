//
//  CoffeeViewModel.swift
//  CoffeeOrdering
//
//  Created by adam janusewski on 5/20/22.
//

import Foundation


class CoffeeListViewModel {
    // List all the Coffees
    var cofeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {  //Will allow us to read the information
    
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    //  Accessing the properties
    
    var name: String {
        return self.coffee.name
    }
    
    var imageURL: String {
        return self.coffee.imageURL
    }
    
    var price: Double {
        return self.coffee.price
    }
    
}
