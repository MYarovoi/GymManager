//
//  RegistrationView.swift
//  GymManager
//
//  Created by Никита Яровой on 07.04.2025.
//

import SwiftUI

struct RegistrationView: View {
    @State var fullName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    func loadImage() {
        guard let selectedUIImage = selectedUIImage else { return }
        image = Image(uiImage: selectedUIImage)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    showImagePicker.toggle()
                } label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipped()
                                .clipShape(Circle())
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                        } else {
                            Image(systemName: "photo.on.rectangle.angled")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                                .foregroundStyle(.white)
                        }
                    }
                }.sheet(isPresented: $showImagePicker) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedUIImage)
                }

                
                VStack(spacing: 20) {
                    CustomTextField(text: $fullName, placeholder: "Прізвище та ім'я", imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                    
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
                
                Button {
//                    guard let image = selectedUIImage else { return }
                    
                    Task {
                        try await viewModel.registerUser(email: email, password: password, fullName: fullName)
                    }
                } label: {
                    Text("Створити")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Вже маєш акаунт?")
                            .font(.system(size: 14))
                        
                        Text("Увійти")
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

#Preview {
    RegistrationView()
}
