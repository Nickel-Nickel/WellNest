//
//  BlueTwoView.swift
//  WellNest
//
//  Created by Brandon Struble on 4/17/24.
//

import SwiftUI

struct MoodView: View{
    @State private var mood = ""
    @State private var date = Date()
    @State private var chosenMood: MoodType? = nil          //variable to store currently selected mood
    @State private var showMoodLog = false
    @State private var moodLog: [MoodData] = []
    
    
    
    enum MoodType: String {
        case happy = "happy"
        case neutral = "neutral"
        case sad = "sad"
    }
    
    var body: some View{
        
        VStack(spacing: 20) {
            Text("Log your mood")
                .font(.largeTitle)

            ZStack{
                Image("icon_happy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        if chosenMood == .happy {
                            chosenMood = nil
                        } else {
                            chosenMood = .happy
                        }                    }
                    .overlay{
                        Circle().stroke(chosenMood == .happy ? Color.green : Color.clear, lineWidth: 10)
                    }
                    .frame(width: 100, height: 100)
                    .offset(x: 125)
                
                Image("icon_neutral")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        if chosenMood == .neutral {
                            chosenMood = nil
                        } else {
                            chosenMood = .neutral
                        }                    }
                    .overlay{
                        Circle().stroke(chosenMood == .neutral ? Color.green : Color.clear, lineWidth: 10)
                    }
                    .frame(width: 100, height: 100)
                
                Image("icon_sad")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        if chosenMood == .sad {
                            chosenMood = nil
                        } else {
                            chosenMood = .sad
                        }                    }
                    .overlay{
                        Circle().stroke(chosenMood == .sad ? Color.green : Color.clear, lineWidth: 10)
                    }
                    .frame(width: 100, height: 100)
                    .offset(x: -125, y: 0)
            }
            .frame(width: 350, height: 120)
            
            DatePicker("Date", selection: $date)

            
            
            Button {
                if let chosenMood = chosenMood {
                    let newMoodData = MoodData(mood: chosenMood.rawValue, time: Date(), date: date)
                    moodLog.insert(newMoodData, at: 0)
                }
                chosenMood = nil
            } label : {
                Text("Enter")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(uiColor: .systemBackground))
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(uiColor: .label))
                    )
            }
            
            Button(action: {
                showMoodLog.toggle()
            }) {
                    Text("Mood Log")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    )
            }
            
        }
        .padding(.horizontal)
        .sheet(isPresented: $showMoodLog) {
            MoodLogView(moodLog: moodLog)
        }
    }
}

struct MoodView_Previews: PreviewProvider{
    static var previews: some View{
        MoodView()
    }
}

