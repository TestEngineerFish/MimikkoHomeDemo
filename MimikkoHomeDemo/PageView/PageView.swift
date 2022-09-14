//
//  PageView.swift
//  SwiftUIDemo
//
//  Created by sam on 2022/9/5.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.pink.opacity(0.3)
            HStack {
                PageViewController(pages: pages, currentPage: $currentPage)
            }
            .cornerRadius(20, corners: .topRight)
            .cornerRadius(20, corners: .bottomRight)
            .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 2))
        }
        .cornerRadius(20, corners: .topRight)
        .cornerRadius(20, corners: .bottomRight)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(
            pages: ModelData().pageModelList.map({ FeatureCard(model: $0) })
        )
        .aspectRatio(2, contentMode: .fit)
    }
}
