//
//  OnboardingView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 3/16/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.12).ignoresSafeArea()
            VStack {
                Spacer()
                Image("yardWork")
                    .resizable()
                    .frame(width: .infinity, height: 175)
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 65) {
                VStack {
                    Text("Type of Account")
                        .font(.largeTitle.bold())
                    Text("Choose the type of your account")
                }
                
                HStack(spacing: 5) {
                    VStack(spacing: 15) {
                        Image("lawnBlock")
                            .resizable()
                            .frame(width: 110, height: 110)
                        
                        Text("Owner")
                            .font(.title)
                    }
                    .padding(32)
                    .padding(.vertical, 65)
                    .background(Color.gray.opacity(0.12)).cornerRadius(15)
                    
                    VStack(spacing: 15) {
                        Image("lawnMower")
                            .resizable()
                            .frame(width: 110, height: 110)
                        
                        Text("Mower")
                            .font(.title)
                    }
                    .padding(32)
                    .padding(.vertical, 65)
                    .background(Color.gray.opacity(0.12)).cornerRadius(15)
                }
                //.padding()
                Spacer()
                    .frame(height: 100)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true) // hides the back button
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
