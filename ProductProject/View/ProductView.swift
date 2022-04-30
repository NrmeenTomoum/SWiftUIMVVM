//
//  ProductView.swift
//  ProductProject
//
//  Created by Nermeen Tomoum on 27/04/2022.
//

import SwiftUI

struct ProductView: View {
    @State var isSelected = false
    private let product: Product
    private let currency: String
    private var viewModel : ProductListViewModel
    private var gridItemLayout =    [GridItem(.adaptive(minimum:50))]
    private let width = UIScreen.main.bounds.size.width/2 - 48
    init(product: Product, viewModel: ProductListViewModel ) {
        self.viewModel = viewModel
        self.product = product
        self.currency = viewModel.productList.currency
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            ZStack (alignment: .topLeading){
                AsyncImage(url: URL(string:product.image)) { image in
                    image.resizable()
                        .shadow(radius: 0)
                } placeholder: {
                    ProgressView()
                }
                .frame(width:width, height: width * 1.4)
                HStack{
                    LazyVGrid(columns: gridItemLayout, spacing: 0) {
                        ForEach(product.badges  , id: \.self){    badge in
                            BadgeView(title:badge.rawValue)
                        }
                    }.frame(width: width - 25)
                    Button(action: {
                        isSelected = !isSelected
                        isSelected ?  viewModel.addToWishList(product: product) : viewModel.removeFromWishList(product: product)
                        
                    }) {
                        Image(self.viewModel.isInWishList(product: product) ? "saved-icon" : "unsaved-icon").resizable().frame(width: 25, height: 30)
                    }
                }
            }
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

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product(id: "", sku: "", image: "https://i.imgur.com/nZkuhr9m.jpg", brand: "title-1", name: "SAINT LAURENT", price: 2333, originalPrice: 4657, badges: [.NEW,.SALE]), viewModel: ProductListViewModel())
    }
}
