//
//  ProductWishListView.swift
//  ProductProject
//
//  Created by Nrmeen Tomoum on 29/04/2022.
//

import SwiftUI
struct ProductWishListView: View {
    @Environment(\.presentationMode) var presentationMode
    private let productWishList: ProductList
    private let width = UIScreen.main.bounds.size.width

    init(viewModel: ProductListViewModel) {
        self.productWishList = viewModel.productWishList
    }
    var body: some View {
        
        List(productWishList.items, id: \.id) { product in
            HStack(spacing: 0) {
                ProductWishView(product: product, currency: productWishList.currency)

                NavigationLink(destination: ProductDetails()) {
                    EmptyView()
                }
                .frame(width: 0)
                .opacity(0)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.init(uiColor: UIColor.init(hexaString: "#fbfbfb")))
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image("close-icon").resizable().frame(width: 30, height: 30)
                    }
                }
            }
        }
        .navigationTitle("WISHLSIT (2)")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
        .navigationBarBackButtonHidden(true)
        .background((Color.init(uiColor: UIColor.init(hexaString: "#fbfbfb"))))
        .frame( maxWidth: .infinity)
        .listStyle(PlainListStyle())
    }
}

struct ProductWishListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductWishListView(viewModel: ProductListViewModel())
    }
}
