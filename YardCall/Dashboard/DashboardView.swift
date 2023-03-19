//
//  DashboardView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 3/16/23.
//

import SwiftUI
import Foundation

struct DashboardView: View {
    @ObservedObject var viewModel = DashboardViewModel()
    @ObservedObject var loginViewModel = LoginViewModel()
    @State private var pictureSize = 35.0
    //@State private var currentUser: User
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: pictureSize, height: pictureSize)
                
                Text("Hello, \(viewModel.getFirstName(user: loginViewModel.currentUser))")
                    .font(.title2)
                Spacer()
            }.padding()
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true) // hides the back button
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
