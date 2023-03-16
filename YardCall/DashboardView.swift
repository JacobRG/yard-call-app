//
//  DashboardView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 3/16/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
            Text("Welcome to the dashboard!")
                .font(.title)
                .padding()
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
