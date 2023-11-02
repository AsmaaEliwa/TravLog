//
//  testSwiftUIView.swift
//  TravLog
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

struct testSwiftUIView: View {
    @State private var position: CGPoint = .zero
        
    let earthImage = Image(systemName: "globe")
        
        var body: some View {
            ZStack {
                earthImage
                    .foregroundColor(.blue)
                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                    .position(position)
                    .onAppear() {
                        withAnimation(Animation.linear(duration: 10.0).repeatForever(autoreverses: false)) {
                            position = CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height / 2)
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    struct EarthMovingView_Previews: PreviewProvider {
        static var previews: some View {
            testSwiftUIView()
        }
    }
