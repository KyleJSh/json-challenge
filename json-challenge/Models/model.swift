//
//  model.swift
//  json-challenge
//
//  Created by Kyle Sherrington on 2021-01-30.
//

import Foundation

class Pizza: Identifiable, Decodable {
    
    var id:UUID?
    var name = ""
    var toppings = ""
    
}
