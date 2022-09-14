//
//  FeatureCard.swift
//  SwiftUIDemo
//
//  Created by sam on 2022/9/5.
//

import SwiftUI

struct FeatureCard: View {
    
    var model: PageModel
    
    var body: some View {
        model.image
            .resizable()
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(model: ModelData().pageModelList[0])
    }
}
