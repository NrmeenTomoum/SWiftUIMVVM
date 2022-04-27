//
//  ProductModel.swift
//  ProductProject
//
//  Created by Nermeen Tomoum on 27/04/2022.
//

import Foundation

struct ProductList: Decodable, Hashable {
    let title: String
    let currency: String
    let items: [Product]
}

struct Product: Decodable, Hashable {
    let id: String
    let sku: String
    let image: String
    let brand: String
    let name: String
    let price: Double
    let originalPrice: Double?
    let badges: [String]
    var priceRoundWithCurrency : String {
        return price.removeZerosFromEnd()
    }
    var originalPriceRoundWithCurrency : String {
        return price.removeZerosFromEnd()
    }
}
