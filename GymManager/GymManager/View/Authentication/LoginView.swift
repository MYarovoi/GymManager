//
//  LoginView.swift
//  GymManager
//
//  Created by Никита Яровой on 07.04.2025.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image("phoenix")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                        .padding(.top, 120)
                        .padding(.bottom, 50)
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder: "Email", imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(.white)
                        
                        SecureTextField(text: $password, placeholder: "Password", imageName: "lock")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Забув пароль?")
                                .font(.footnote)
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.top, 16)
                                .padding(.trailing, 32)
                        }
                        
                    }
                    
                    Button {
                        Task {
                            try await viewModel.login(email: email, password: password)
                        }
                    } label: {
                        Text("Увійти")
                            .font(.headline)
                            .foregroundStyle(.blue)
                            .frame(width: 360, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        RegistrationView().navigationBarBackButtonHidden()
                    } label: {
                        HStack {
                            Text("Немає профілю?")
                                .font(.system(size: 14))
                            
                            Text("Створити")
                                .font(.system(size: 14,weight: .semibold))
                        }
                        .foregroundStyle(.white)
                        .padding(.bottom, 40)
                    }

                }
            }
            .background(Color(ThemeColors.darkBlue))
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LoginView()
}
