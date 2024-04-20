//
//  NutritionItemView.swift
//  WellNest
//
//  Created by Reyssan Sambitan on 4/18/24.
//

import SwiftUI

struct MacroHeaderView: View {
    var carbs: Int
    var fats: Int
    var proteins: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Image("carbs")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                
                Text("Carbs")
                
                Text("\(carbs) g")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.1))
            )
            
            Spacer()
            
            VStack {
                Image("fats")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                
                Text("Fats")
                
                Text("\(fats) g")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.1))
            )
            
            Spacer()
            
            VStack {
                Image("protein")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                
                Text("Protein")
                
                Text("\(proteins) g")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.1))
            )
            Spacer()
        }
    }
}

//#Preview {
//    MacroHeaderView(carbs: .constant(18), fats: .constant(88), proteins: .constant(50) )
//}
