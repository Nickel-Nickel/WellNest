//
//  NutritionView.swift
//  WellNest
//
//  Created by Reyssan Sambitan on 4/18/24.
//

import SwiftUI
import SwiftData

struct NutritionView: View {
    @Environment(\.modelContext) var modelContext
    @State var carbs = 0
    @State var fats = 0
    @State var proteins = 0
    
    @Query var macros: [Macro]
    @State var dailyMacros = [DailyMacro]()
    
    @State var showTextField = false
    @State var food = ""
        
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading){
                    Text("Today's Macros")
                        .font(.largeTitle)
                        .padding()
                    
                    MacroHeaderView(carbs: carbs, fats: fats, proteins: proteins)
                        .padding()
                    
                    
                    VStack(alignment: .leading) {
                        Text("Previous Meals")
                            .font(.title)
                        
                        ForEach(dailyMacros) { macro in
                            MacroDayView(macro: macro)
                                
                        }
                    }
                    .padding()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem{
                    Button{
                        showTextField = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.black, .black)
                    }
                    
                }
            }
            .sheet(isPresented: $showTextField) {
                AddMacroView()
                    .presentationDetents([.fraction(0.5)])
            }
            .onAppear {
                fetchDailyMacros()
                fetchTodaysMacros()
            }
            .onChange(of: macros) { _, _ in
                fetchDailyMacros()
                fetchTodaysMacros()
            }
        }
    }
    
    private func saveMacro(_ result: MacroResult) {
        let macro = Macro(food: result.food, createdAt: .now, date: .now, carbs: result.carbs, fats: result.fats, proteins: result.proteins)
        modelContext.insert(macro)
    }
    
    private func fetchDailyMacros() {
        let dates: Set<Date> = Set(macros.map({Calendar.current.startOfDay(for: $0.date)}))
        
        var dailyMacros = [DailyMacro]()
        for date in dates {
            let filterMacros = macros.filter({Calendar.current.startOfDay(for: $0.date) == date})
            let carbs: Int = filterMacros.reduce(0, {$0 + $1.carbs})
            let fats: Int = filterMacros.reduce(0, {$0 + $1.fats})
            let proteins: Int = filterMacros.reduce(0, {$0 + $1.proteins})
            
            let macro = DailyMacro(date: date, carbs: carbs, fats: fats, proteins: proteins)
            dailyMacros.append(macro)
        }
        self.dailyMacros = dailyMacros.sorted(by: {$0.date > $1.date})
    }
    
    private func fetchTodaysMacros() {
        if let firstDateMacro = dailyMacros.first, Calendar.current.startOfDay(for: firstDateMacro.date) ==  Calendar.current.startOfDay(for: .now) {
            carbs = firstDateMacro.carbs
            fats = firstDateMacro.fats
            proteins = firstDateMacro.proteins
        }
    }
}

#Preview {
    NutritionView()
}
