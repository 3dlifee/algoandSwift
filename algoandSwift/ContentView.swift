//
//  ContentView.swift
//  algoandSwift
//
//  Created by Mario Fernandes on 23/03/2021.
//

import SwiftUI


struct ContentView: View {
    
    @State private var transactionIsShowing = false
    
    
    var body: some View {
        
        VStack(alignment: .leading) {//vs1
            
            Image("imageMenu")
                
                
                .edgesIgnoringSafeArea(.top)
                
                .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width)
            
            
            VStack(alignment: .leading) {//vs1
                
                Text("Services")
                    .font(.custom("AvenirNext-Bold", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 10.0)
                
                Text("Airport")
                    .font(.custom("Avenir-Bold", size: 24))
                    
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding([.leading, .bottom], 10.0)
                
            }
            
            
            VStack(){
                fuelService()
                
                Spacer()
                
            }
            
            .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width)//vs000
            .edgesIgnoringSafeArea(.all)
            .background(Color.white)
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
