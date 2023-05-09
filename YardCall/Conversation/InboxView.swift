//
//  InboxView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/14/23.
//

import SwiftUI

struct InboxView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        VStack {
            Text("Conversations:")
                .font(.title)
            ScrollView {
                ForEach(userViewModel.user!.conversations, id: \.id) { conversation in
                    ConvoCard(conversation: conversation)
//                    Button {
//                        ConversationView()
//                    } label: {
//                        ConvoCard(conversation: conversation)
//                    }
//                    .foregroundColor(Color.black)
                }
            }
        }
        .background(Color.background)
    }
}

struct ConvoCard: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var conversation: Conversation
    var user1: User {
        userViewModel.user!
    }
    var user2: User {
        userViewModel.fetchUser(id: conversation.user2)
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text("\(user2.firstname) \(user2.lastname)")
                    .font(.title2).bold()
                Text(user2.role)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "arrow.right")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
        .background(Color.background)
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
