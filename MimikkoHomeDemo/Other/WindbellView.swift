//
//  WindbellView.swift
//  MimikkoHomeDemo
//
//  Created by sam on 2022/9/14.
//

import SwiftUI

struct WindbellView: View {
    @State private var degrees: Double = 0
    @State private var currentDegrees: Double = 0
    @State private var timer: Timer?
    @State private var change: Bool = true
    private let cardSize: CGSize = CGSize(width: 80, height: 200)
    var body: some View {
        VStack {
            FlipView($change) {
                IconImage(name: "alarm", size: cardSize)
            } backView: {
                IconImage(name: "page", size: cardSize)
            }
            .rotationEffect(Angle(degrees: degrees), anchor: UnitPoint(x: 0.5, y: 0))
            Spacer()
            Button("click") {
                start()
            }
        }
    }
    
    func start() {
        self.timer = Timer(timeInterval: 3, repeats: true, block: { timer in
            withAnimation(.spring(response: 1.2, dampingFraction: 0.1, blendDuration: 0.1)) {
                degrees = Double.random(in: -30...30)
                if degrees > 15 {
                    change.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        degrees = 0
                        if Bool.random() && degrees > 5 {
                            change.toggle()
                        }
                    }
                }
            }
        })
        RunLoop.current.add(timer!, forMode: .common)
        self.timer?.fire()
    }
}

struct WindbellView_Previews: PreviewProvider {
    static var previews: some View {
        WindbellView()
    }
}
