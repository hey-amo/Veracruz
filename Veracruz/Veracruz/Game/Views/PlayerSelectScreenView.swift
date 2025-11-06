//
//  PlayerSelectScreenView.swift
//  Veracruz
//
//  Created by Amarjit on 02/11/2025.
//

import SwiftUI

struct PlayerSelectScreenView: View {
    let navigationHandler: NavigationHandler

    @State private var selectedPlayers: [SelectedPlayer] = []
    
    private let availableAvatars: [AvatarResource] = [.avt1, .avt2, .avt3, .avt4]
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Select Players")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Choose 2-4 players. At least 1 must be human.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Avatar selection grid
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(availableAvatars, id: \.self) { avatar in
                    AvatarSelectionCard(
                        avatar: avatar,
                        isSelected: isAvatarSelected(avatar),
                        playerType: getPlayerType(for: avatar),
                        onSelect: { toggleAvatar(avatar) },
                        onToggleType: { togglePlayerType(avatar) }
                    )
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Play button
            Button(action: startGame) {
                Text("Play")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(canStartGame ? Color.blue : Color.gray)
                    .cornerRadius(12)
            }
            .disabled(!canStartGame)
            .padding(.horizontal)
            .padding(.bottom)
        }.navigationBarTitle("New Game", displayMode: .inline)
    }
    
    private var canStartGame: Bool {
        selectedPlayers.count >= 2 && selectedPlayers.contains { !$0.isAI }
    }
    
    private func isAvatarSelected(_ avatar: AvatarResource) -> Bool {
        selectedPlayers.contains { $0.avatar == avatar }
    }
    
    private func getPlayerType(for avatar: AvatarResource) -> Bool? {
        selectedPlayers.first { $0.avatar == avatar }?.isAI
    }
    
    private func toggleAvatar(_ avatar: AvatarResource) {
        if let index = selectedPlayers.firstIndex(where: { $0.avatar == avatar }) {
            // Avatar is selected - deselect if we have more than 2 players
            if selectedPlayers.count > 2 {
                selectedPlayers.remove(at: index)
            }
        } else {
            // Avatar is not selected - add it
            if selectedPlayers.count < 4 {
                selectedPlayers.append(SelectedPlayer(avatar: avatar, isAI: false))
            }
        }
    }
    
    private func togglePlayerType(_ avatar: AvatarResource) {
        if let index = selectedPlayers.firstIndex(where: { $0.avatar == avatar }) {
            selectedPlayers[index].isAI.toggle()
        }
    }
    
    private func startGame() {
        // TODO: Navigate to GameView with selected players
        print("Starting game with players: \(selectedPlayers)")
    }
}

struct SelectedPlayer {
    let avatar: AvatarResource
    var isAI: Bool
}

struct AvatarSelectionCard: View {
    let avatar: AvatarResource
    let isSelected: Bool
    let playerType: Bool? // nil = not selected, false = human, true = AI
    let onSelect: () -> Void
    let onToggleType: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            // Avatar circle
            ZStack {
                Circle()
                    .fill(isSelected ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                    .frame(width: 100, height: 100)
                
                Image(avatar.rawValue)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 3)
                    )
                
                // Player type indicator
                if let isAI = playerType {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: isAI ? "cpu" : "person.fill")
                                .foregroundColor(.white)
                                .font(.caption)
                                .padding(6)
                                .background(isAI ? Color.red : Color.green)
                                .clipShape(Circle())
                                .offset(x: -5, y: -5)
                        }
                    }
                    .frame(width: 100, height: 100)
                }
            }
            .onTapGesture {
                onSelect()
            }
            
            // Toggle button or selection indicator
            if isSelected {
                Button(action: onToggleType) {
                    HStack(spacing: 4) {
                        Image(systemName: playerType == true ? "cpu" : "person.fill")
                        Text(playerType == true ? "AI" : "Human")
                    }
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
            } else {
                Text("Tap to add")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: isSelected ? Color.blue.opacity(0.3) : Color.gray.opacity(0.2), radius: isSelected ? 8 : 4)
    }
}

#Preview {
    PlayerSelectScreenView(navigationHandler: NavigationHandler())
}
