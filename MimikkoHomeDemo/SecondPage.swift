//
//  SecondPage.swift
//  MimikkoHomeDemo
//
//  Created by sam on 2022/9/15.
//

import SwiftUI

struct SecondPage: View {
    
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            TabSub(idx: 0)
                .foregroundColor(.red)
                .tabItem {
                    Text("0")
                }
            TabSub(idx: 1)
                .foregroundColor(.orange)
                .tabItem {
                    Text("1")
                }
        }
    }
}

struct TabSub: View {
    @State var loaded = false
    let idx: Int
    var body: some View {
        Text("View \(idx)")
            .onAppear {
                print("tab \(idx) appear")
                if !loaded {
                    print("load data \(idx)")
                    loaded = true
                }
            }
            .onDisappear{
                print("tab \(idx) disappear")
            }
    }
}

struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        SecondPage()
    }
}
