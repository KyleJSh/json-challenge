//
//  ContentView.swift
//  json-challenge
//
//  Created by Kyle Sherrington on 2021-01-30.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = PizzaModel()
    
    var body: some View {
        
        List(model.pizzas) { pizza in
            
            VStack (alignment: .leading) {
                
                Text(pizza.name)
                    .font(.headline)
                HStack {
                    Text(pizza.toppings[0])
                    Text(pizza.toppings[1])
                    Text(pizza.toppings[2])
                }
                Text(pizza.amount)
                    .font(.headline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
