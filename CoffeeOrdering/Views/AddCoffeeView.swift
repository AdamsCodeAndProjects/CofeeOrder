//
//  AddCoffeeView.swift
//  CoffeeOrdering
//
//  Created by adam janusewski on 5/20/22.
//

import SwiftUI

struct AddCoffeeView: View {
    
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter name", text: self.$addCoffeeOrderVM.name)
                    }
                    
                    Section(header: Text("SELECT COFFEE").font(.body)) {
                        ForEach(addCoffeeOrderVM.coffeeList, id:\.name) { coffee in
                            
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    }
                    
                    // SIZE SELECTION
                    Section(header: Text("SELECT COFFEE").font(.body), footer: Text("Total")) {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                            
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                HStack {
                    Button("Place Order") {
                        
                    }
                } .padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(Color.white)
                    .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                    .cornerRadius(10)
            }
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeView()
    }
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark":"").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
