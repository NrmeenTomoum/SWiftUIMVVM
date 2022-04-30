//
//  ProductWishView.swift
//  ProductProject
//
//  Created by Nrmeen Tomoum on 29/04/2022.
//

import SwiftUI

struct ProductWishView: View {
    private let product: Product
    private let currency: String
    private let width = UIScreen.main.bounds.size.width/2 - 48
    init(product: Product, currency: String) {
        self.product = product
        self.currency = currency
    }
    var body: some View {
        VStack(alignment: .leading){
        HStack(alignment: .top, spacing: 5){
                AsyncImage(url: URL(string:product.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }.frame(width: width, height: width*1.5)
                VStack(alignment: .leading, spacing: 5){
                    Text(product.brand.uppercased())
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    Text(product.name.uppercased())
                        .font(.system(size: 12))
                        .foregroundColor(Color.init(uiColor: UIColor.init(hexaString: "#6d6d6d")))
                        .padding(.bottom, 8)
                HStack {
                    Text("\(product.priceRoundWithCurrency) \(currency)").font(.system(size: 12)).foregroundColor(Color.init(uiColor: UIColor.init(hexaString: "#6d6d6d")))
                }
                  
                }
        }.padding(.top, 16)
        HStack {
            Spacer()
            Button(action: {
            }) {
                HStack {
                    Image("remove").resizable().frame(width: 100, height: 30)
                }
            }
        }.padding(.trailing, 50)
            Divider()           

        }
    }
}

struct ProductWishView_Previews: PreviewProvider {
    static var previews: some View {
        ProductWishView(product: Product(id: "", sku: "", image: "https://i.imgur.com/nZkuhr9m.jpg", brand: "title-1", name: "SAINT LAURENT", price: 2333, originalPrice: 4657, badges: ["",""]), currency: "AED")
    }
}
