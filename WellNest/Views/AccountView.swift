//
//  GreenThreeView.swift
//  WellNest
//
//  Created by Brandon Struble on 4/17/24.
//


import SwiftUI

struct AccountView: View{
    
    var body: some View{
        ZStack{
            Circle().frame(width: 400, height: 400).foregroundColor(.green)
            Image("burt2")
                .resizable()
                .scaledToFit()
        }
    }
    
}

struct AccountView_Previews: PreviewProvider{
    static var previews: some View{
        AccountView()
    }
}
