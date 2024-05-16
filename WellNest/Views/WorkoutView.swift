//
//  WorkoutView.swift
//  WellNest
//
//  Created by Reyssan Sambitan on 4/18/24.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        ZStack {
            Color(red: 0.98, green: 0.95, blue: 0.95)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Your Workouts")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.black)
                    .padding()
                    .padding(.trailing, 120)
                Spacer()
            }
            
            VStack {
                Spacer() // push the button to the bottom
                HStack {
                    Spacer() // push the button to the right
                    AddWorkoutButton(title: "Add Workout", textColor: .white, backgroundColor: .blue)
                        .padding(.bottom, 50) // Adjust the padding value to move the button higher
                        .padding(.trailing, 20) // Adjust padding to the right if needed
                }
            }
        }
    }
}

struct AddWorkoutButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Button(action: {
            // action when pressed
            print("Button tapped")
        }) {
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(textColor) // Set the text color to white
                .frame(width: 150, height: 50)
                .background(backgroundColor)
                .cornerRadius(5.0)
        }
    }
}

#Preview {
    WorkoutView()
}



