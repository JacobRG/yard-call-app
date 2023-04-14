//
//  DashboardView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 3/16/23.
//

import SwiftUI
import Foundation

struct DashboardView: View {
    @EnvironmentObject var user: UserViewModel
    @StateObject var viewModel = DashboardViewModel()
    @State private var pictureSize = 35.0
    
    var body: some View {
            NavigationView {
                VStack {
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: pictureSize, height: pictureSize)
                        
                        Text("Hello, \(user.user?.firstname ?? "")")
                            .font(.title2)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                    
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
