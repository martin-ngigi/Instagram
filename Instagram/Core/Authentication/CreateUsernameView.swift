//
//  CreateUsernameView.swift
//  Instagram
//
//  Created by Martin Wainaina on 13/12/2023.
//

import SwiftUI

struct CreateUsernameView: View {
    
    @State private var username =  ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("Add your username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this username to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            TextField("Email", text: $username)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink{
                CreateUsernameView()
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
        .toolbar{ // We don't need to add NavigationStack to CreateUsernameView since there is NavigationStack in LoginView. It all flows this root view (CreateUsernameView)
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

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
