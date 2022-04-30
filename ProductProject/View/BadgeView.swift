//
//  BadgeView.swift
//  ProductProject
//
//  Created by Nrmeen Tomoum on 30/04/2022.
//

import SwiftUI

struct BadgeView: View {
    private var title: String
    init(title: String) {
        self.title = title
    }
    var body: some View {
        Text(title.uppercased())
            .font(.system(size: 11))
            .foregroundColor(.black)
            .padding(3)
            .background(Color.init(uiColor: UIColor.init(hexaString: "#f5f5f5")))
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(title: "SALE")
    }
}
