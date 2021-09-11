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
    
    func makeCoordinator() -> Coordinator {
        return OffsetPageView.Coordinator.init(parent: self)
    }
    
    init(offset: Binding<CGFloat>, @ViewBuilder content: @escaping () -> Content){
        
        self.content = content()
        self._offset = offset
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollView = UIScrollView()
        
        //Extracting SwiftUI View and embedding into UIKit ScrollView...
        let hostView = UIHostingController(rootView: content)
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            
            hostView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            //if you are using vertical Paging...
            //then dont declare height constraint...
            hostView.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ]
        
        scrollView.addSubview(hostView.view)
        scrollView.addConstraints(constraints)
        
        //Enabling　Paging...
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        //Setting Delegate...
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // need to update only when offset changed manually...
        // just check the current and scrollview offset...
        let currentOffet = uiView.contentOffset.x
        
        if currentOffet != offset {
            print("updating")
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
        
        
    }
    
    //Page Offset...
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: OffsetPageView
        
        init(parent: OffsetPageView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
        }
    }
}

struct OffsetPageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

