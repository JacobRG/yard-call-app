//
//  DashboardView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 3/16/23.
//

import SwiftUI
import Foundation

struct DashboardView: View {
    //@StateObject var sessionManager = SessionManager()
    @StateObject var viewModel = DashboardViewModel()
    @ObservedObject var authLoginViewModel = AuthLoginViewModel()
    @ObservedObject var firestoreManager = FirestoreManager()
    @State private var pictureSize = 35.0
    private var user: User?
    private var email = AuthLoginView().email
    
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
                VStack {
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: pictureSize, height: pictureSize)
                        
                        Text("Hello, \(dataManager.user.firstname)")
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
            .environmentObject(DataManager())
    }
}
