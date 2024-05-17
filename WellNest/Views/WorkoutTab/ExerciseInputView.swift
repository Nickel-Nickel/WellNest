//
//  ExerciseInputView.swift
//  WellNest
//
//  Created by Reyssan Sambitan on 5/17/24.
//

import SwiftUI

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
    ExerciseInputView()
}
