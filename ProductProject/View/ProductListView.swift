//
//  ProductList.swift
//  ProductProject
//
//  Created by Nermeen Tomoum on 27/04/2022.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel = ProductListViewModel()
    private var gridItemLayout = Array(repeating:  GridItem(.flexible()), count: 2)
    private let width = UIScreen.main.bounds.size.width/2 - 48

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 5) {
                    ForEach(viewModel.productList.items  , id: \.self){ product in
                        NavigationLink(destination: ProductDetails()) {
                            ProductView(product: product, currency :viewModel.productList.currency).frame(width: width, height: width * 2.5)
                        }
                    }
                }.padding().background(Color.white)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationTitle(viewModel.productList.title)
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(edges: .bottom)
            .onAppear {
                self.viewModel.fetchProducts()
            }
        }
    }
}

//struct ProductList_Previews: PreviewProvider {
////    static var previews: some View {
////        ProductList()
////    }
//}