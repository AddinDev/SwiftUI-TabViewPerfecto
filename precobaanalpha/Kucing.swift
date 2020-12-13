//
//  Kucing.swift
//  precobaanalpha
//
//  Created by addjn on 04/12/20.
//

import Foundation

protocol Product {
    var id: String { get set }
    var name: String { get set }
    var price: String { get set }
    func getProduct(id: String)
}

class Electronic: Product {
 
    var id: String
    
    var name: String
    
    var price: String
    
    var productionDate: String
    
    func getProduct(id: String) {
        
    }
    
    internal init(id: String, name: String, price: String, productionDate: String) {
        self.id = id
        self.name = name
        self.price = price
        self.productionDate = productionDate
    }
   
}
