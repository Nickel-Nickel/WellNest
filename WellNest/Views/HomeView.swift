//
//  RedOneView.swift
//  WellNest
//
//  Created by Brandon Struble on 4/17/24.
//

import SwiftUI

struct HomeView: View{
    
    /* its a common convention to use 'body'
     to represent our current view */
    
    /*body  will return some type that conform to the view
     protocol but it not specifying an exact type. This allows
     us to return different kinds of views without knowing their
     exact type */
    var body: some View{
        //PLACE HOLDER
        /*ZStack is a SwiftUI container view
         that stacks its contents on top of each other.
         In this case, it stacks a Circle and a Text view.*/
        ZStack{
            Circle().frame(width: 200, height: 200).foregroundColor(.red)
            Text("Home").foregroundColor(.white).font(.system(size: 70, weight: .bold))
        }
    }
    
}

struct Home_Previews: PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}
