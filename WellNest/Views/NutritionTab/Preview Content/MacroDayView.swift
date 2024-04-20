//
//  MacroDayView.swift
//  WellNest
//
//  Created by Reyssan Sambitan on 4/19/24.
//

import SwiftUI

struct MacroDayView: View {
    @State var macro: DailyMacro
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(macro.date.monthAndDay)
                    .font(.title2)
                
                Text(macro.date.year)
                    .font(.title2)
                    
            }
            .frame(width: 80, alignment: .leading)
            
            HStack {
                VStack {
                    Image("carbs")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    
                    Text("Carbs")
                    
                    Text("\(macro.carbs) g")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.1))
                )
            
                
                VStack {
                    Image("fats")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    
                    Text("Fats")
                    
                    Text("\(macro.fats) g")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.1))
                )
              
                
                VStack {
                    Image("protein")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
//                    
                    Text("Protein")
                    
                    Text("\(macro.proteins) g")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.1))
                )
            }
        }
    }
}

#Preview {
    MacroDayView(macro: DailyMacro(date: .now, carbs: 70, fats: 20, proteins: 30))
}
