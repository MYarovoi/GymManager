//
//  ProfileActionButtonView.swift
//  GymManager
//
//  Created by Никита Яровой on 10.04.2025.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
            if viewModel.member.isCurrentUser {
                    HStack {
                        Button("Редагувати профіль") {
                            isPresented.toggle()
                        }
                        .frame(width: 180, height: 45)
                        .foregroundStyle(Color(.white))
                        .background(Color(ThemeColors.coral))
                        .font(.system(size: 15, weight: .semibold))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        Button("Придбати абонемент") {
                            
                        }
                        .frame(width: 180, height: 45)
                        .foregroundStyle(Color(.white))
                        .background(Color(ThemeColors.coral))
                        .font(.system(size: 15, weight: .semibold))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal)
            } else {
                HStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(ThemeColors.yellow))
                        Text("17")
                            .font(.caption)
                    }
                    
                    Button("Вподобати") {
                        
                    }
                    .frame(width: 100, height: 45)
                    .foregroundStyle(Color(.white))
                    .background(Color(ThemeColors.coral))
                    .font(.system(size: 15, weight: .semibold))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.leading)
                }
                .padding(.horizontal)
            }
        }
    }
