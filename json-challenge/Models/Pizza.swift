//
//  model.swift
//  json-challenge
//
//  Created by Kyle Sherrington on 2021-01-30.
//

import Foundation

class Pizza: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var toppings:[String]
    var amount:String
    
}
