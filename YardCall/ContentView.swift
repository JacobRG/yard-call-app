//
//  ContentView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 3/15/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserViewModel
    
    var body: some View {
        NavigationView {
            if user.userIsAuthenticatedAndSynced {
                if user.user?.role == "" {
                    OnboardingView()
                } else {
                    MainView().environmentObject(MainViewModel())
                }
                MainView().environmentObject(MainViewModel())
            } else {
                AuthLoginView()
            }
        }
    }
}
