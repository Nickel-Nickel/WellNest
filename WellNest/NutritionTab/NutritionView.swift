//
//  NutritionView.swift
//  WellNest
//
//  Created by Reyssan Sambitan on 4/18/24.
//

import SwiftUI

struct NutritionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Today's Macros")
                .font(.title)
                .padding()
            
            HStack {
                Spacer()
                
                VStack {
                    Image("carbs")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    
                    Text("Carbs")
                    
                    Text("82 g")
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
                    
                    Text("52 g")
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
                    
                    Text("72 g")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.1))
                )
                Spacer()
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Previous Meals")
                    .font(.title)
            }
            .padding()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    NutritionView()
}
