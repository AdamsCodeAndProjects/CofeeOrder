//
//  ContentView.swift
//  CoffeeOrdering
//
//  Created by adam janusewski on 5/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    var body: some View {
        
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)
                .navigationBarTitle("Coffee Orders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
