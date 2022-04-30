//
//  ProductDetails.swift
//  ProductProject
//
//  Created by Nrmeen Tomoum on 28/04/2022.
//

import SwiftUI

struct ProductDetails: View {
    @Environment(\.presentationMode) var presentationMode
    @State var isSelected = false
    private let product: Product
    private var viewModel : ProductListViewModel
    private var gridItemLayout =    [GridItem(.adaptive(minimum:35))]

    private let width = UIScreen.main.bounds.size.width
    init(product: Product, viewModel: ProductListViewModel ) {
        self.viewModel = viewModel
        self.product = product
    }
    var body: some View {
        VStack(alignment: .center, spacing: 5){
            LazyVGrid(columns: gridItemLayout, spacing: 0) {
                ForEach(product.badges  , id: \.self){    badge in
                    BadgeView(title:badge.rawValue)
                }
            }.padding([.top,.leading], 16)
            
            AsyncImage(url: URL(string:product.image)) { image in
                image.resizable().shadow(radius: 0)
            } placeholder: {
                ProgressView()
            }    .frame(width:width, height: width * 1.3)
            
            Text(product.brand.uppercased())
                .font(.system(size: 16))
                .padding(.top, 16)
                .foregroundColor(.black)
            Text(product.name.uppercased())
                .font(.system(size: 12))
                .foregroundColor(Color.init(uiColor: UIColor.init(hexaString: "#6d6d6d")))
                .padding(.bottom, 16)
            HStack {
                Text("\(product.priceRoundWithCurrency) \(viewModel.productList.currency)")
                    .font(.system(size: 12))
                    .foregroundColor(Color.init(uiColor: UIColor.init(hexaString: "#6d6d6d")))
                    .padding(.trailing, 5)
                
                Text(product.getOriginalPriceRoundWithCurrency(currency: viewModel.productList.currency)).font(.system(size: 12)).foregroundColor(Color.init(uiColor: UIColor.init(hexaString: "#cccccc")))  .strikethrough(true, color: .gray)
            }
            Spacer()
            Button(action: {
                isSelected = !isSelected
                isSelected ?  viewModel.addToWishList(product: product) : viewModel.removeFromWishList(product: product)
                
            }) {
                Text("ADD TO BAG").foregroundColor(.white)
            }
            .padding([.trailing,.top], 8)
            .frame(width: width-32, height: 50).background(.black)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                }) {
                    HStack {
                        NavigationLink(destination: ProductWishListView(viewModel: viewModel)) {
                            Image("unsaved-icon").resizable()
                                .frame(width: 35, height: 40)
                        }
                    }
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.backward").resizable().frame(width: 20, height: 13).colorMultiply(.black)
                    }
                }
            }
            
        }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(product: Product(id: "", sku: "", image: "https://i.imgur.com/nZkuhr9m.jpg", brand: "title-1", name: "SAINT LAURENT", price: 2333, originalPrice: 4657, badges: [.NEW,.SALE]), viewModel: ProductListViewModel())
    }
}
