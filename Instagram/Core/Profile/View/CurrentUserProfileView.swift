//
//  CurrentUserProfile.swift
//  Instagram
//
//  Created by Martin Wainaina on 13/12/2023.
//

import SwiftUI

struct CurrentUserProfileView: View {

    let user: User
    
//    var posts: [Post] {
//        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
//    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                // Header
                ProfileHeaderView(user: user)
                        
                // post grid view
                PostGridView(user: user)
                
            }
            .navigationTitle("Profile")
            //.navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        // signOut user
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
