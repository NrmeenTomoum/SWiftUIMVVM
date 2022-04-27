//
//  ProductView.swift
//  ProductProject
//
//  Created by Nermeen Tomoum on 27/04/2022.
//

import SwiftUI

struct ProductView: View {
    private let product: Product
    private let currency: String
    private let width = UIScreen.main.bounds.size.width/2 - 48
    init(product: Product, currency: String) {
        self.product = product
        self.currency = currency
    }
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 5){
            AsyncImage(url: URL(string:product.image)) { image in
                image.resizable().shadow(radius: 0)
            } placeholder: {
                ProgressView()
            }
            .frame(width:width, height: width)
            Text(product.brand).font(.subheadline).padding(.top, 16).foregroundColor(.black)
            Text(product.name).font(.system(size: 12)).foregroundColor(.gray).padding(.bottom, 16)
            HStack {
                Text("\(product.priceRoundWithCurrency) \(currency)").font(.system(size: 12)).foregroundColor(.gray)
                Spacer()
                Text("\(product.originalPriceRoundWithCurrency) \(currency)").font(.system(size: 12)).foregroundColor(.gray)  .strikethrough(true, color: .gray)
            }
            }
            Spacer()
        }.padding()
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product(id: "", sku: "", image: "https://i.imgur.com/nZkuhr9m.jpg", brand: "title-1", name: "SAINT LAURENT", price: 2333, originalPrice: 4657, badges: ["",""]), currency: "AED")
    }
}
