//
//  CreatePasswordView.swift
//  Instagram
//
//  Created by Martin Wainaina on 13/12/2023.
//

import SwiftUI

struct CreatePasswordView: View {
    @State private var password =  ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12){
            Text("Create a password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Your password must be strong and atleast 6 characters in length.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .modifier(IGTextFieldModifier())
                .padding(.top)
            
            NavigationLink{
                CompleteSignupView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar{ // We don't need to add NavigationStack to CreatePasswordView since there is NavigationStack in LoginView. It all flows this root view (CreatePasswordView)
            ToolbarItem(placement: .navigationBarLeading){
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
            
        }
        
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
