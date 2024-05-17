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

struct Exercise: Identifiable {
    // each exercisesaved can be idenitfied by a unique ID
    let id = UUID()
    // and each expercise has these attributes/columns kinda like a database
    var name: String
    var sets: String
    var reps: String
    var lbs: String
}

struct ExerciseInputView: View {
    @Environment(\.presentationMode) var presentationMode
    /**Binding propery wrapper allows the child view to read & write to a variable
     owned parent view. Here we want to save all attributes of a Excercise  **/
    @Binding var exercises: [Exercise]
    @State private var name: String = ""
    @State private var sets: String = ""
    @State private var reps: String = ""
    @State private var lbs: String = ""
    

    var body: some View {
        NavigationView {
            // This is where the user types
            Form {
                Section(header: Text("Exercise Details")) {
                    // The TextField decribes the text box before typing
                    TextField("Name", text: $name)
                        .keyboardType(.default)
                    TextField("Sets", text: $sets)
                        .keyboardType(.numberPad)
                    TextField("Reps", text: $reps)
                        .keyboardType(.numberPad)
                    TextField("Lbs", text: $lbs)
                        .keyboardType(.decimalPad)
                    
                }
            }
            .navigationBarTitle("Add Exercise", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Add") {
                let exercise = Exercise(name:name, sets: sets, reps: reps, lbs: lbs)
                exercises.append(exercise) // update the array in the parent view (WorkoutInputView)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

#Preview {
    WorkoutInputView()
}
