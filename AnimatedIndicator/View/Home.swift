//
//  Home.swift
//  Home
//
//  Created by jyrnan on 2021/9/11.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        VStack{
            
            Button{
                
            } label: {
                Image(systemName: "house")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
            }
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
