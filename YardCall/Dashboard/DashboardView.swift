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
    
    var body: some View {
        VStack {
            AddressBar()
            Spacer()
            VStack {
                Dashboard()
                Services()
                SearchButton()
                Spacer()
                
            }
        }
        .frame(maxHeight: .infinity)
        .background(Color.background)
    }
}

struct AddressBar: View {
    @EnvironmentObject var user: UserViewModel
    @State private var pictureSize = 20.0
    
    var body: some View {
        HStack {
            Image(systemName: "location.fill")
                .resizable()
                .frame(width: pictureSize, height: pictureSize)
            
            Text("\(user.user?.address?.streetnumber ?? "Address") \(user.user?.address?.address ?? "bar")")
                .font(.title3)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .padding()
    }
}

struct Dashboard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("My")
                    Text("YardCall")
                        .fontWeight(.bold)
                }
                .font(.title)
                Spacer()
                
                ProfilePicture()
            }
            .frame(width: .infinity)
            
            HStack {
                HStack {
                    Text("Last:")
                    Spacer()
                    Text("Today")
                }
                .padding(18)
                .frame(width: 250, height: 40)
                .background(Color.lightgreen)
                .cornerRadius(12)
                
            }.padding(.vertical, 2)
            
            Text("Need mowed?")
//                .padding(.vertical, 2)
                .font(.title2)
                .fontWeight(.semibold)
            
            Divider()
                .frame(height: 5)
                .overlay(Color.card2)
        }
        .padding(.horizontal, 25)
    }
}

struct ProfilePicture: View {
    @StateObject var viewModel = DashboardViewModel()
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.black, lineWidth: 1.5)
                .frame(width: 78, height: 78)
            
            if let image = self.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
            } else {
                Button(action: { shouldShowImagePicker.toggle() }) {
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.card2)
                }
            }
        }
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
        }
    }
}

struct Services: View {
    @StateObject var viewModel = DashboardViewModel()
    @State private var weeding = false
    @State private var mowing = false
    @State private var trimming = false
    @State private var more = false
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button("Today") {
                    print("TODAY!")
                }
                .frame(maxWidth: 190, maxHeight: 40)
                .background(Color.card2)
                .foregroundColor(Color.black)
                .cornerRadius(12)
                
                Button("Schedule") {
                    print("SCHEDULE!")
                }
                .frame(maxWidth: 190, maxHeight: 40)
                .background(Color.card2)
                .foregroundColor(Color.black)
                .cornerRadius(12)
            }
            
            HStack {
                Button(action: { weeding.toggle() }) {
                    Text("Weeder")
                        .frame(maxWidth: 190, maxHeight: 190)
                        .background(Color.card2)
                        .foregroundColor(Color.black)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(weeding ? Color.black : Color.clear, lineWidth: 3))
                }
                
                Button(action: { mowing.toggle() }) {
                    Text("Mower")
                        .frame(maxWidth: 190, maxHeight: 190)
                        .background(Color.card2)
                        .foregroundColor(Color.black)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(mowing ? Color.black : Color.clear, lineWidth: 3))
                }
            }
            
            HStack {
                Button(action: { trimming.toggle() }) {
                    Text("Trimmer")
                        .frame(maxWidth: 190, maxHeight: 190)
                        .background(Color.card2)
                        .foregroundColor(Color.black)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(trimming ? Color.black : Color.clear, lineWidth: 3))
                }
                
                Button(action: { more.toggle() }) {
                    Text("More")
                        .frame(maxWidth: 190, maxHeight: 190)
                        .background(Color.card2)
                        .foregroundColor(Color.black)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(more ? Color.black : Color.clear, lineWidth: 3))
                }
            }
        }.padding()
    }
}

struct SearchButton: View {
    var body: some View {
        Button(action: { print("Searching...") }) {
            Text("Search")
                .frame(maxWidth: 390, maxHeight: 60)
                .background(Color.perfectblue)
                .foregroundColor(Color.white)
                .cornerRadius(12)
        }
    }
}

struct TopMower: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "steeringwheel")
                    Text("Noss Services")
                        .font(.title3)
                    .fontWeight(.semibold)
                }
                HStack {
                    Text("5.0")
                    Image(systemName: "star.fill")
                    Text("(527)")
                }
                .foregroundColor(Color.gray)
            }
            Spacer()
            
            Image(systemName: "arrow.right")
                .frame(width: 35, height: 35)
                .background(Color.card2)
                .cornerRadius(100)
        }
        .frame(maxWidth: .infinity)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(UserViewModel())
//        Dashboard()
        TopMower()
    }
}
