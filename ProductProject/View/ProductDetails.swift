//
//  ProductDetails.swift
//  ProductProject
//
//  Created by Nrmeen Tomoum on 28/04/2022.
//

import SwiftUI

struct ProductDetails: View {
        @State var isSelected = false
        private let product: Product
        private let currency: String
        private var viewModel : ProductListViewModel
        private let width = UIScreen.main.bounds.size.width
        init(product: Product, viewModel: ProductListViewModel ) {
            self.viewModel = viewModel
            self.product = product
            self.currency = viewModel.productList.currency
        }
        var body: some View {
            VStack(alignment: .center, spacing: 5){
                    AsyncImage(url: URL(string:product.image)) { image in
                        image.resizable().shadow(radius: 0)
                    } placeholder: {
                        ProgressView()
                    }    .frame(width:width, height: width * 1.5)
               
                Text(product.brand.uppercased())
                    .font(.system(size: 16))
                    .padding(.top, 16)
                    .foregroundColor(.black)
                Text(product.name.uppercased())
                    .font(.system(size: 12))
                    .foregroundColor(Color.init(uiColor: UIColor.init(hexaString: "#6d6d6d")))
                    .padding(.bottom, 16)
                HStack {
                    Text("\(product.priceRoundWithCurrency) \(currency)")
                        .font(.system(size: 12))
                        .foregroundColor(Color.init(uiColor: UIColor.init(hexaString: "#6d6d6d")))
                        .padding(.trailing, 5)
                    
                    Text(product.getOriginalPriceRoundWithCurrency(currency: currency)).font(.system(size: 12)).foregroundColor(Color.init(uiColor: UIColor.init(hexaString: "#cccccc")))  .strikethrough(true, color: .gray)
                }
                Spacer()
            }
        }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(product: Product(id: "", sku: "", image: "https://i.imgur.com/nZkuhr9m.jpg", brand: "title-1", name: "SAINT LAURENT", price: 2333, originalPrice: 4657, badges: ["",""]), viewModel: ProductListViewModel())
    }
}
