//
//  ContentView.swift
//  AnimatedIndicator
//
//  Created by jyrnan on 2021/9/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        GeometryReader{proxy in
            
            let size = proxy.size
            
            Home(screenSize:size)
                .preferredColorScheme(.dark)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
