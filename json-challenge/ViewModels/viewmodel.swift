//
//  viewmodel.swift
//  json-challenge
//
//  Created by Kyle Sherrington on 2021-01-30.
//

import Foundation

class PizzaModel:ObservableObject {
    
    @Published var pizzas = [Pizza]()
    
    init() {
        
        // 1) Get the path to the json file within the app bundle
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        if let path = pathString {
            
            // 2) Create a URL object
            let url = URL(fileURLWithPath: path)
            
            // 3) Error Handling: Do, Try, Catch
            do {
                // 5) Create a data object with the data at the url
                let data = try Data(contentsOf: url)
                // 6) Parse the data
                let decoder = JSONDecoder()
                
                // 7) Another do, try, catch
                do {
                    // 8) add decoder.code
                    let pizzaData = try decoder.decode([Pizza].self, from: data)
                    
                    // Set a unique ID for each pizza in the pizzaData array, as this is going into a List, which requires IDs
                    for p in pizzaData {
                        p.id = UUID()
                    }
                }
                catch {
                    print(error)
                }
            }
            // 4) Catch goes just at bottom of "do"
            catch {
                print(error)
            }
        }
    }
}
