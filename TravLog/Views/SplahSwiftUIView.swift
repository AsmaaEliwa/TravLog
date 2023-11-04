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
           
            Image("Image 1").resizable()
                       
                .frame(maxWidth:  .infinity, maxHeight: .infinity).ignoresSafeArea(.all)
                .scaledToFit()
            VStack{
               
                HStack(spacing: 30 ){
                    NavigationLink(destination: LogInSwiftUIView()){
                        Label("Sign In", systemImage: "person.fill")
                            .font(.system(size: 25 )).foregroundColor(.green)
                            .shadow(color: Color.green, radius: 5, x: 0, y: 0)
                        Spacer()
                    
                    NavigationLink(destination: SignUpView()){
                        Label("Sign Up", systemImage: "person.badge.plus")
                            .font(.system(size:25 )).foregroundColor(.green).shadow(color: Color.green, radius: 5, x: 0, y: 0)
                        
                    }
                       
                }
                   
                  
                }.padding()
//                testSwiftUIView()
                Spacer()
            }.padding()
          
            
        }
        }
    }


#Preview {
    SplahSwiftUIView()
}
