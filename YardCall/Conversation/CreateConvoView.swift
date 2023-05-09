//
//  CreateConvoView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/23/23.
//

import SwiftUI

struct CreateConvoView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Choose a user:")
                .font(.title)
            ScrollView {
                ForEach(userViewModel.users, id: \.id) { user in
                    Button {
                        userViewModel.createConvo(Conversation(id: UUID().uuidString, user1: userViewModel.user!.id, user2: user.id, timestamp: Date.now))
                    } label: {
                        UserOption(user: user)
                    }
                    .foregroundColor(Color.black)
                }
            }
        }
    }
}

struct UserOption: View {
    var user: User
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text("\(user.firstname) \(user.lastname)")
                    .font(.title2).bold()
                Text(user.role)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "plus")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
        .background(Color.background)
    }
}

struct CreateConvoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateConvoView()
    }
}
