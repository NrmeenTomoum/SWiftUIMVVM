//
//  ProductListViewModel.swift
//  ProductProject
//
//  Created by Nermeen Tomoum on 27/04/2022.
//

import Foundation

import Combine
import SwiftUI

class ProductListViewModel: ObservableObject {
    private let url = "https://run.mocky.io/v3/5c138271-d8dd-4112-8fb4-3adb1b7f689e"
    private var task: AnyCancellable?
    
    @Published var productList: ProductList = ProductList(title: "", currency: "", items: [])
    @Published var productWishList : ProductList = ProductList(title: "", currency: "", items: [])
    func fetchProducts() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: ProductList.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { print ("Received completion: \($0).") },
                  receiveValue: { user in
                print ("Received user: \(user).")
                self.productList = user
            })
    }
    
    func addToWishList(product: Product){
        productWishList.items.append(product)
    }
    func removeFromWishLsit(product: Product){
        if let itemToRemoveIndex = productWishList.items.firstIndex(of: product) {
        productWishList.items.remove(at:itemToRemoveIndex)
        }
    }
}
