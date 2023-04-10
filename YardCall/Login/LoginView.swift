////
////  LoginView.swift
////  YardCall
////
////  Created by Jacob Gambrell on 3/15/23.
////
//
//import SwiftUI
//
//struct LoginView: View {
//    @ObservedObject var viewModel = LoginViewModel()
//    @ObservedObject var session: SessionManager
//    @State private var id = ""
//    @State private var username = ""
//    @State private var password = ""
//    @State private var firstname = ""
//    @State private var lastname = ""
//    @State private var email = ""
//    @State private var signupLoginSegmentValue = 0
//
//    init() {
//        let loginModel = LoginModel()
//        self.session = SessionManager(loginModel: loginModel)
//    }
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.blue
//                    .ignoresSafeArea()
//                VStack {
//                    Image(systemName: "person.circle")
//                        .resizable()
//                        .frame(width: 100, height: 100)
//                        .padding(.bottom, 50)
//                        .foregroundColor(Color.white)
//
//                    VStack {
//                        Picker(selection: $signupLoginSegmentValue,
//                               label: Text("Login Picker")) {
//                            Text("Login").tag(0)
//                            Text("Sign Up").tag(1)
//                        }
//                               .pickerStyle(.segmented)
//                               .background(Color.gray.opacity(0.2))
//                               .cornerRadius(20)
//                               .padding(.bottom, 20)
//
//                        TextField("Username", text: $username)
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 10)
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                            .padding(.bottom, 20)
//
//                        TextField("Password", text: $password)
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 10)
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                            .padding(.bottom, 20)
//
//                        switch signupLoginSegmentValue {
//                        case 1:
//                            TextField("First Name", text: $firstname)
//                                .padding(.horizontal, 20)
//                                .padding(.vertical, 10)
//                                .background(Color.gray.opacity(0.2))
//                                .cornerRadius(10)
//                                .padding(.bottom, 20)
//
//                            TextField("Last Name", text: $lastname)
//                                .padding(.horizontal, 20)
//                                .padding(.vertical, 10)
//                                .background(Color.gray.opacity(0.2))
//                                .cornerRadius(10)
//                                .padding(.bottom, 20)
//
//                            TextField("Username", text: $username)
//                                .padding(.horizontal, 20)
//                                .padding(.vertical, 10)
//                                .background(Color.gray.opacity(0.2))
//                                .cornerRadius(10)
//                                .padding(.bottom, 20)
//
//                            NavigationLink(destination: OnboardingView(), isActive: $viewModel.shouldNavigateToOnboarding) {
//                                EmptyView()
//                            }
//
//                            Button("Sign up") {
//                                viewModel.createAccount(username: username, password: password, firstname: firstname, lastname: lastname, email: email)
//                            }
//                            .foregroundColor(.white)
//                            .padding(.horizontal, 40)
//                            .padding(.vertical, 10)
//                            .background(Color.green)
//                            .cornerRadius(10)
//
//                        default:
//                            EmptyView()
//
//                            NavigationLink(destination: DashboardView(viewModel: DashboardViewModel()), isActive: $viewModel.shouldNavigateToDashboard) {
//                                EmptyView()
//                            }
//
//                            Button("Log in") {
//                                session.login(username: username, password: password) { error in
//
//                                }
//                            }
//                            .foregroundColor(.white)
//                            .padding(.horizontal, 40)
//                            .padding(.vertical, 10)
//                            .background(Color.cyan)
//                            .cornerRadius(10)
//
//                            if let errorMessage = viewModel.errorMessage {
//                                Text(errorMessage)
//                                    .foregroundColor(.red)
//                            }
//                        }
//                    }
//                    .padding(45)
//                    .background(Color.white).cornerRadius(35)
//                }
//                .padding(.horizontal, 30)
//                .padding(.bottom, 70)
//            }
//        }
//        .navigationBarTitle("")
//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
