//
//  WorkoutInputView.swift
//  WellNest
//
//  Created by Brandon Struble on 5/16/24.
//

// reference: https://youtu.be/ddr3E0l4gIQ?si=ZHKda7pFES_n2-BN


import SwiftUI

struct WorkoutInputView: View {
    //presenationMode is how we present a new View/aka our WorkoutInput
    // we can close our segue thanks to this line
    @Environment(\.presentationMode) var presentationMode
    @State private var workoutName: String = ""
    // @State will keep track of the current status of our variables
    @State private var exercises: [Exercise] = []
    @State private var showExerciseForm = false

    var body: some View {
        NavigationView {
            VStack {
                TextField("Workout Name", text: $workoutName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    showExerciseForm = true
                }) {
                    Text("Add Exercise")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showExerciseForm) {
                    ExerciseInputView(exercises: $exercises)
                }

                List {
                    ForEach(exercises) { exercise in
                        VStack(alignment: .leading) {
                            Text("Excersise Name: \(exercise.name)")
                            Text("Set: \(exercise.sets)")
                            Text("Reps: \(exercise.reps)")
                            Text("Lbs: \(exercise.lbs)")
                            
                        }
                    }
                }

                Spacer()
            }
            .navigationBarTitle("Add Workout", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

#Preview {
    WorkoutInputView()
}
