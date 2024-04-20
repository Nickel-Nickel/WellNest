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
    
    enum MoodType {
        case happy
        case neutral
        case sad
    }
    
    var body: some View{
//        ZStack{
//            Circle().frame(width: 200, height: 200).foregroundColor(.blue)
//            Text("Mood").foregroundColor(.white).font(.system(size: 70, weight: .bold))
//        }

        
        VStack(spacing: 20) {
            
            Text("Log your mood")
                .font(.largeTitle)
/*             TextField("How do you feel?", text: $mood)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke()
                )
*/
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
                chosenMood = nil
            } label : {
                Text("Done")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(uiColor: .systemBackground))
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(uiColor: .label))
                    )
                
            }
        }
        .padding(.horizontal)
    }
}

struct MoodView_Previews: PreviewProvider{
    static var previews: some View{
        MoodView()
    }
}

