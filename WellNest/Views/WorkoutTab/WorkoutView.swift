//
//  WorkoutView.swift
//  WellNest
//
//  Created by Reyssan Sambitan on 4/18/24.
//

// a good video reference can be found on YouTube by Sean Allen
// on how stacks work

import SwiftUI

struct WorkoutView: View {
    @State private var showingWorkoutInput = false

    var body: some View {
        ZStack {
            Color.white
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
                Spacer()
                HStack {
                    Spacer()

                    Button(action: {
                        showingWorkoutInput = true
                    }) {
                        AddWorkoutButton(title: "Add Workout", textColor: .white, backgroundColor: .blue)
                    }
                    .padding(.bottom, 50)
                    .padding(.trailing, 20)
                    /* the sheet modifier will "slide up" a view/segue
                     where the user can enter info*/
                    // only if the sheet is present will I allow for input
                    .sheet(isPresented: $showingWorkoutInput) {
                        // control is passed to the WorkoutInputView file
                        WorkoutInputView()
                    }
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
        Text(title)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(textColor)
            .frame(width: 150, height: 50)
            .background(backgroundColor)
            .cornerRadius(5.0)
    }
}

#Preview {
    WorkoutView()
}




