//
//  LogInSwiftUIView.swift
//  TravLog
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

struct LogInSwiftUIView: View {
    @State var username = ""
    @State var password = ""
    var body: some View {
        TittleView(label: "Sign In").padding(.top)
        VStack(spacing: 30){
            Group{
                input(label: "Username", placeholder: "Enter username", text: $username)
                input(label: "Password", placeholder: "Enter Password", text: $password)
                Button{
                    
                }label: {
                    Label("Sign In", systemImage: "arrow.right.circle.fill")
                }
            }.padding()
            Spacer()
        }
    }
}

#Preview {
    LogInSwiftUIView()
}
