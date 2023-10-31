//
//  SplahSwiftUIView.swift
//  TravLog
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

struct SplahSwiftUIView: View {
    @State private var isAnimating = false
    var body: some View {
        ZStack{
            Image("Image").resizable()
//            .scaledToFill()
            .frame(maxWidth:  .infinity, maxHeight: .infinity).ignoresSafeArea(.all)
       
        Button{
            withAnimation {
                isAnimating.toggle()}
        }label: {
            NavigationLink(destination: ContentView()){
                Label("get started", systemImage: "heart.fill")
                    .font(.system(size: 30 )).foregroundColor(.black)
                
            }
        } .scaleEffect(isAnimating ? 1.2 : 1.0) // Scale the button when isAnimating is true
                .animation(.easeInOut(duration: 0.3))
        }
        }
    }


#Preview {
    SplahSwiftUIView()
}
