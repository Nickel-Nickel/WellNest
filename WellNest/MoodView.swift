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
    
    var body: some View{
//        ZStack{
//            Circle().frame(width: 200, height: 200).foregroundColor(.blue)
//            Text("Mood").foregroundColor(.white).font(.system(size: 70, weight: .bold))
//        }
        VStack(spacing: 20) {
            Text("Log your mood")
                .font(.largeTitle)
            TextField("How do you feel?", text: $mood)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke()
                )
            DatePicker("Date", selection: $date)
            
            Button {
                
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

