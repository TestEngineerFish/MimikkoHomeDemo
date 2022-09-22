//
//  flipView.swift
//  MimikkoHomeDemo
//
//  Created by sam on 2022/9/7.
//

import SwiftUI

struct FlipView<CardView: View>: View {
    
    @Binding var flip: Bool
    var frontView: CardView
    var backView: CardView
    @State private var degrees: Double = 180
    
    init(_ flip: Binding<Bool>, @ViewBuilder frontView: ()->CardView, @ViewBuilder backView: ()->CardView) {
        self._flip      = flip
        self.frontView  = frontView()
        self.backView   = backView()
    }
    
    var body: some View {
        (degrees > 90 ? backView : frontView)
            .modifier(flipAnimation(degreesBinding: $degrees, degrees: flip ? 0 : 180))
    }
}

struct FlipView_Previews: PreviewProvider {
    @State static var change: Bool = false
    
    static var previews: some View {
        FlipView($change) {
            IconImage(name: "alarm", size: CGSize(width: 60, height: 160))
        } backView: {
            IconImage(name: "cake", size: CGSize(width: 60, height: 160))
        }.onTapGesture {
            withAnimation {
                change.toggle()
            }
        }
    }
}

struct flipAnimation: Animatable, ViewModifier {
    @Binding var degreesBinding: Double
    var degrees: Double
    var animatableData: Double {
        get {
            degrees
        }
        set {
            degrees = newValue
            let _self = self
            DispatchQueue.main.async {
                _self.degreesBinding = newValue
            }
        }
    }
    
    func body(content: Content) -> some View {
        content.rotation3DEffect(Angle(degrees: degrees), axis: (0,1,0))
    }
}
