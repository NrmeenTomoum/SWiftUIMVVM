//
//  ProductModel.swift
//  ProductProject
//
//  Created by Nermeen Tomoum on 27/04/2022.
//

import Foundation
enum Badges : String, Decodable{
    case NEW, SALE
}
struct ProductList: Decodable, Hashable {
    let title: String
    let currency: String
    var items: [Product]
}

struct Product: Decodable, Hashable {
    let id: String
    let sku: String
    let image: String
    let brand: String
    let name: String
    let price: Double
    let originalPrice: Double?
    let badges: [Badges]
    var priceRoundWithCurrency : String {
        return price.removeZerosFromEnd()
    }
    func getOriginalPriceRoundWithCurrency(currency: String)-> String{
        if let originalPrice = originalPrice{
            return "\(originalPrice.removeZerosFromEnd()) \(currency)"
        }
        return ""
    }
}
