//
//  ServicesView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 3/16/23.
//

import SwiftUI

struct ServicesView: View {
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 8) {
                    HStack {
                        Text("Services")
                            .font(.largeTitle.bold())
                        Spacer()
                    }
                    //.padding()
                    
                    HStack {
                        Text("Lawn Maintenance")
                            .font(.title)
                        Spacer()
                    }
                    //.padding()
                }
                .padding()
                
                VStack(spacing: 15) {
                    HStack(spacing: 15) {
                        VStack(spacing: 5) {
                            Image("weedeater")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Text("Weed")
                            
                        }
                        .padding(.horizontal, 40)
                        .padding()
                        .background(Color.gray.opacity(0.12)).cornerRadius(15)
                        
                        VStack(spacing: 5) {
                            Image("trimmer")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Text("Trim")
                            
                        }
                        .padding(.horizontal, 40)
                        .padding()
                        .background(Color.gray.opacity(0.12)).cornerRadius(15)
                    }
                    
                    VStack(spacing: 5) {
                        Image("lawnMowerRed")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("Mow")
                        
                    }
                    .padding(.horizontal, 130)
                    .padding()
                    .background(Color.gray.opacity(0.12)).cornerRadius(15)
                }
                
                Spacer()
                
                Text("Search")
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 130)
                    .padding()
                    .background(Color.black).cornerRadius(10)
            }
            .padding()
            
        }
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}
