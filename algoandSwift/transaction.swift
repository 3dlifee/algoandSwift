//
//  transaction.swift
//  algoandSwift
//
//  Created by Mario Fernandes on 23/03/2021.
//

import SwiftUI

struct transaction: View {
    @Binding var transactionIsShowing: Bool
   
    
    var body: some View {
        
        
        VStack(alignment: .center) {//vs1
            
            HStack {
                Spacer()
                
                Button(action: {
                    transactionIsShowing = false
                }) {
                    Image("closePag")
                        .padding([.top, .bottom, .trailing], 80.0)
                }
            }
            
            Image("transactionImg")
                
                
                
                
                
                .edgesIgnoringSafeArea(.top)
                
                .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width)
            
            Spacer()
            
        }
        .background((Color("backG")))
        .edgesIgnoringSafeArea(.all)
    }
}

struct transaction_Previews: PreviewProvider {
    static private var transactionIsShowing = Binding.constant(false)
    static var previews: some View {
        transaction(transactionIsShowing: transactionIsShowing)
    }
}
