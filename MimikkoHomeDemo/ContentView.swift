//
//  ContentView.swift
//  MimikkoHomeDemo
//
//  Created by sam on 2022/9/5.
//

import SwiftUI

struct ContentView: View {
    
    var modelData: ModelData = ModelData()
    @State private var showButton = true
    @State private var offset: CGFloat = 0
    @State private var degrees: CGFloat = 0
    @State private var change: Bool = false
    private let cardSize = CGSize(width: 60, height: 60)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 10, content: {
                        Group {
                            IconImage(name: "alarm", size: cardSize)
                            IconImage(name: "alarm", size: cardSize)
                            IconImage(name: "alarm", size: cardSize)
                            IconImage(name: "alarm", size: cardSize)
                            IconImage(name: "alarm", size: cardSize)
                            IconImage(name: "alarm", size: cardSize)
                            WindbellView(cardSize: CGSize(width: 50, height: 100))
                        }
                        .padding(.leading, 30)
                        Spacer()
                        PageView(pages: modelData.pageModelList.map({ FeatureCard(model: $0) }))
                            .aspectRatio(2, contentMode: .fit)
                            .listRowInsets(EdgeInsets())
                            .frame(width: 150, height: 75)
                    })
                    .offset(x: -offset)
                    .opacity(showButton ? 1 : 0)
                    Spacer()
                    VStack {
                        Button("隐藏按钮") {
                            withAnimation(.easeInOut) {
                                showButton.toggle()
                                if showButton {
                                    offset = 0
                                } else {
                                    offset = 100
                                }
                            }
                        }
                        VStack(alignment: .trailing, spacing: 10) {
                            VStack {
                                Group {
                                    FlipView($change) {
                                        IconImage(name: "alarm", size: cardSize)
                                    } backView: {
                                        IconImage(name: "cake", size: cardSize)
                                    }
                                    FlipView($change) {
                                        IconImage(name: "alarm", size: cardSize)
                                    } backView: {
                                        IconImage(name: "cake", size: cardSize)
                                    }
                                    FlipView($change) {
                                        IconImage(name: "alarm", size: cardSize)
                                    } backView: {
                                        IconImage(name: "cake", size: cardSize)
                                    }
                                }
                            }
                            .rotation3DEffect(Angle(degrees: 180), axis: (0,1,0))
                            .padding(.trailing, 30)
                            Spacer()
                            Image("change")
                                .resizable()
                                .frame(width: 100, height: 60, alignment: .trailing)
                                .onTapGesture {
                                    withAnimation(.spring(response: 1, dampingFraction: 0.4, blendDuration: 0.4), {
                                        change.toggle()
                                    })
                                }
                        }
                        .offset(x: offset)
                        .opacity(showButton ? 1 : 0)
                        .animation(.easeInOut, value: showButton)
                    }
                }
                Spacer()
                NavigationLink {
                    SecondPage()
                } label: {
                    Text("click me")
                }
                
                HStack(alignment: .center, spacing: 15) {
                    IconImage(name: "alarm", size: cardSize)
                    IconImage(name: "alarm", size: cardSize)
                    IconImage(name: "alarm", size: cardSize)
                    IconImage(name: "alarm", size: cardSize)
                    IconImage(name: "alarm", size: cardSize)
                }
                .padding(.bottom, showButton ? 20 : -offset)
                .padding(.leading, 15)
                .opacity(showButton ? 1 : 0)
            }
            .task {
                var i = 0
                while !Task.isCancelled {
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                    print("task: \(i)")
                    i += 1
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
            .previewDevice("iPhone 13")
    }
}
