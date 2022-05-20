//
//  Webservice.swift
//  CoffeeOrdering
//
//  Created by adam janusewski on 5/19/22.
//

import Foundation

class Webservice {
    
    // MARK: CREATE ORDER
    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> ()) {
        
        guard let url = URL(string: "https://islnad-bramble.glitch.me/orders") else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("applcation/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
                completion(createOrderResponse)
            }
        }.resume()
    }
    
// MARK: GET ALL ORDERS
    func getAllOrders(completion: @escaping ([Order]?) -> ()) {  // Will be called or passed to a completion function so it will escape the context
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                completion(nil)
                return
            }
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
        }.resume() // If not present, network call will not be made
        
    }
}
