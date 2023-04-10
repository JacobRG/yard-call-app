//
//  LoadingView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/7/23.
//

import SwiftUI

struct LoadingView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        if dataManager.user.firstname == "John" {
            content
        } else {
            DashboardView()
                .environmentObject(DataManager())
        }
    }
    
    var content: some View {
        Text("Loading...")
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .environmentObject(DataManager())
    }
}
