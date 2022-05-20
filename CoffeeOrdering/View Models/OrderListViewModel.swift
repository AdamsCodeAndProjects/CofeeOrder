//
//  OrderListViewModel.swift
//  CoffeeOrdering
//
//  Created by adam janusewski on 5/20/22.
//

import Foundation

// Observable - Once we put something as a Publisher, then whenever we assign that value to the variable, it will Publish, and it will tell the subscribers something has changed
class OrderListViewModel: ObservableObject {
 
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        
        Webservice().getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }  //  Getting orders from webservice and we assign it to the orders
        }
    }
    
}

class OrderViewModel {
    
    let id = UUID()  //  Needed to ensure each item is unique
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return self.order.name
    }
    
    var size: String {
        return self.order.size
    }
    
    var coffeeName: String {
        return self.order.coffeeName
    }
    
    var total: Double {
        return self.order.total
    }
}
