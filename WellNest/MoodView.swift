//
//  BlueTwoView.swift
//  WellNest
//
//  Created by Brandon Struble on 4/17/24.
//

import SwiftUI

struct MoodView: View{
    
    var body: some View{
        ZStack{
            Circle().frame(width: 200, height: 200).foregroundColor(.blue)
            Text("Mood").foregroundColor(.white).font(.system(size: 70, weight: .bold))
        }
    }
    
}

struct MoodView_Previews: PreviewProvider{
    static var previews: some View{
        MoodView()
    }
}

