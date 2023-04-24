//
//  MenuView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/13/23.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var user: UserViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(user.user?.firstname ?? "") \(user.user?.lastname ?? "")")
                        .font(.title)
                        .bold()
                    Text("\(user.user?.role ?? "")")
                }
                
                Spacer()
                    
            }
            .padding()
            
            HStack(spacing: 15) {
                VStack(spacing: 5) {
                    Image(systemName: "arrow.left.arrow.right")
                    Text("Switch")
                }
                .frame(width: 110, height: 75)
                .background(Color.card2)
                .cornerRadius(12)
                //.foregroundColor(Color.black)
                
                VStack(spacing: 5) {
                    Image(systemName: "creditcard.fill")
                    Text("Wallet")
                }
                .frame(width: 110, height: 75)
                .background(Color.card2)
                .cornerRadius(12)
                //.foregroundColor(Color.black)
                
                VStack(spacing: 5) {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
                .frame(width: 110, height: 75)
                .background(Color.card2)
                .cornerRadius(12)
                //.foregroundColor(Color.black)
            }
            
            Divider()
                .frame(height: 10)
                .overlay(Color.card2)
            
            Spacer()
            
            Button(action: { user.signOut()}) {
                Text("Sign Out")
                    .frame(width: 250, height: 50)
                    .background(Color.red)
                    .cornerRadius(12)
                    .foregroundColor(Color.white)
                    .padding()
            }
        }
        .background(Color.background)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(UserViewModel())
    }
}
