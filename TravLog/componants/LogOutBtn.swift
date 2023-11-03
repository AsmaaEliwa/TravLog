//
//  LogOutBtn.swift
//  TravLog
//
//  Created by asmaa gamal  on 02/11/2023.
//

import SwiftUI
struct RedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 60, height: 15)
            .padding()
//            .background(Color.red)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}


struct LogOutBtn: View {
    @State var  showLogOutAlert = false
    @AppStorage("username") var storedUsername:String?
    @AppStorage("isLogIn") var isLogIn:Bool?
    var body: some View {
        VStack{
            Button{
                showLogOutAlert = true
            }label: {
                Label("LogOut" , systemImage: "arrow.left.circle").foregroundColor(.red).font(.system(size: 15 ,weight: .medium ))
                    
                    .shadow(color: .red, radius: 10)
            }
//            .buttonStyle(RedButtonStyle())
        }
        .alert(isPresented: $showLogOutAlert) {
            Alert(
                title: Text("Are you sure you want to log out?"),
                               message: Text("Logging out will require you to sign in again."),
                               primaryButton: .cancel(Text("Cancel")),
                               secondaryButton: .destructive(Text("Yes")) {
                                   storedUsername = ""
                                   isLogIn = false
                               }
            )
        }
    }
}
#Preview {
    LogOutBtn()
}
