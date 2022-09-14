//
//  IconImage.swift
//  MimikkoHomeDemo
//
//  Created by sam on 2022/9/7.
//

import SwiftUI

struct IconImage: View {
    
    var name: String
    var size:CGSize
    
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(1, contentMode: .fill)
            .frame(width: size.width, height: size.height)
            .clipped()
    }
}

struct IconImage_Previews: PreviewProvider {
    static var previews: some View {
        IconImage(name: "cake", size: CGSize(width: 40, height: 100))
    }
}
