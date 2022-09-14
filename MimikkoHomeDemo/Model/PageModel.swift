//
//  PageModel.swift
//  MimikkoHomeDemo
//
//  Created by sam on 2022/9/6.
//

import SwiftUI

final class ModelData: ObservableObject {
    @Published var pageModelList = [PageModel(id: 1, name: "page"),PageModel(id: 1, name: "page")]
}

struct PageModel: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    
    var image: Image {
        Image(name)
    }
}
