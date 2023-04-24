//
//  ConversationView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/14/23.
//

import SwiftUI

struct ConversationView: View {
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack {
                UserBar()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .onChange(of: messagesManager.lastMessageId) { id in
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color.background)
            
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

struct UserBar: View {
    var name = "Lauren Good"
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
        .background(Color.background)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
