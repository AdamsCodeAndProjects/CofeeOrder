//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrdering
//
//  Created by adam janusewski on 5/20/22.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    var name: String = ""
    // Must be published for if changes the name of the coffee, we call the publisher to update the interface
    @Published var size: String = "Medium"  //Default Medium
    @Published var coffeeName: String = ""
    
    
    
    private var webservice: Webservice // Declare Web Service
    
    // Retrieving all coffees
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    init() {
        self.webservice = Webservice()  // Must initialize it
    }
    
    //  Setting dictionary for prices
    private func priceForSize() -> Double {
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0] // Dictionary for different sizes
        return prices[self.size]!  // Small, medium, or large
    }
    
    private func calculateTotalPrice() -> Double {
        //  Need a list of coffee that we do not have
        let coffeeVM = coffeeList.first { $0.name == coffeeName } //  get the coffee by name - returns an optional
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {  // Places the order using the webservice
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        self.webservice.createCoffeeOrder(order: order) { _ in
            AddCoffeeView()
        }
    }
}
