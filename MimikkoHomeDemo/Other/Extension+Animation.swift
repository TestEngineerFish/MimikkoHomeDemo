//
//  Extension+Animation.swift
//  MimikkoHomeDemo
//
//  Created by sam on 2022/9/6.
//

import SwiftUI

extension AnyTransition {
    
    static var disappearLeft: AnyTransition {
        .asymmetric(
            insertion:
                    .move(edge: .trailing)
                    .combined(with: .opacity),
            removal:
                    .move(edge: .leading)
                    .combined(with: .opacity)
        )
    }
    
    static var disappearRight: AnyTransition {
        .asymmetric(
            insertion:
                    .move(edge: .trailing)
                    .combined(with: .opacity),
            removal:
                    .move(edge: .leading)
                    .combined(with: .opacity)
        )
    }
}
extension Animation {
    static var disappearLeft: Animation {
        .easeInOut(duration: 1.5)
    }
}
