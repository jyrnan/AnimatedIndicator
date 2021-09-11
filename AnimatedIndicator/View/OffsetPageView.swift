//
//  OffsetPageView.swift
//  OffsetPageView
//
//  Created by jyrnan on 2021/9/11.
//

import SwiftUI

//Custom View that will return offset for Paging Control...
struct OffsetPageView<Content: View>: UIViewRepresentable {
    
    var content: Content
    @Binding var offset: CGFloat
    
    init(offset: CGFloat, @ViewBuider content: @escaping () -> Content){
        
        self.content = content()
        self.offset = offset
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollView = UIScrollView()
        
        //Extracting SwiftUI View and embedding into UIKit ScrollView...
        let hostView = UIHostingController(rootView: content)
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        <#code#>
    }
}

struct OffsetPageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
