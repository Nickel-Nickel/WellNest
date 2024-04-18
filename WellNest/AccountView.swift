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
            Circle().frame(width: 200, height: 200).foregroundColor(.green)
            Text("Account").foregroundColor(.white).font(.system(size: 40, weight: .bold))
        }
    }
    
}

struct AccountView_Previews: PreviewProvider{
    static var previews: some View{
        AccountView()
    }
}
