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
    @AppStorage("username") var storedUsername = ""
    @AppStorage("isLogIn") var isLogIn = false
    @State var showValidationAlert = false
//    @State var loggedInUser: User?
    func reset(){
        username = ""
        password = ""
    }
    var body: some View {
        TittleView(label: "Sign In").padding(.top)
        VStack(spacing: 30){
            Group{
                input(label: "Username", placeholder: "Enter username", text: $username)
                input(label: "Password", placeholder: "Enter Password", text: $password)
                Button{
                    if username.isEmpty || password.isEmpty || DataManger.shared.fetchUser(username: username).isEmpty {
                        showValidationAlert = true
                        print("username is not correct")
                        reset()
                    }else if password == DataManger.shared.fetchUser(username: username)[0].password{
                        print("Logged in with user name \(username)")
                        storedUsername = username
                        isLogIn = true
//                        loggedInUser = DataManger.shared.fetchUser(username: username)[0]
                        //                        reset()
                    }else{
                        showValidationAlert = true
                    }
                    
                }label: {
                    Label("Sign In", systemImage: "arrow.right.circle.fill")
                }
            }.padding()
            Spacer()
            ValidationAlertView(showValidationAlert: $showValidationAlert)
        }
        .background(
                  NavigationLink(
                      "", // Empty label for the link
                      destination: UserProfileView(), // The new view you want to navigate to
                      isActive: $isLogIn // Navigate when 'loggedIn' is true
                  )
              )
    }
       
}

#Preview {
    LogInSwiftUIView()
}
