//
//  LoginView.swift
//  Instagram
//
//  Created by Martin Wainaina on 11/12/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Spacer()
                
                // logo image
                Image("instagram_logo_black")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                // text fields
                VStack{
                    // email
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    // password
                    SecureField("Enter your password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                }
                
                // forgot password
                Button{
                    print("DEBUG: Show forgot password")
                    
                } label: {
                    Text("Forgot Password ?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                // login
                Button{
                    print("DEBUG: Show login")
                    
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding()
                
                // or
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                                    
                }
                .foregroundColor(.gray)
                
                
                HStack{
                    Image("facebook")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }.padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                NavigationLink{
                    Text("Sign Up")
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have account ?")
                        
                        Text("Sign Up")
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
