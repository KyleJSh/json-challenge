//
//  viewmodel.swift
//  json-challenge
//
//  Created by Kyle Sherrington on 2021-01-30.
//

import Foundation

class PizzaModel: ObservableObject {
    
    @Published var pizzas = [Pizza]()
    
    init() {
        
        // 1) Get the path to the json file within the app bundle
        let pathString = Bundle.main.path(forResource: "pizzas", ofType: "json")
        
        if pathString != nil {
            
            // 2) Create a URL object
            let url = URL(fileURLWithPath: pathString!)
            
            // 3) Error Handling: Do, Try, Catch
            do {
                
                // 5) Create a data object with the data at the url
                let data = try Data(contentsOf: url)
                
                // 6) Parse the data
                let decoder = JSONDecoder()
                
                // 7) Another do, try, catch
                do {
                    // 8) add decoder.code
                    let jsonPizzas = try decoder.decode([Pizza].self, from: data)
                    
                    // 9) Set a unique ID for each pizza in the pizzaData array, as this is going into a List, which requires IDs
                    // loop through pizzas and add IDs
                    for index in 0..<jsonPizzas.count {
                        jsonPizzas[index].id = UUID()
                    }
                    
                    // 10) Assign the data to the published property
                    self.pizzas = jsonPizzas
                    
                }
                catch {
                    print("Couldn't parse Pizzas")
                }
            }
            // 4) Catch goes just at bottom of "do"
            catch {
                print("Couldn't create data object")
            }
        }
    }
}


