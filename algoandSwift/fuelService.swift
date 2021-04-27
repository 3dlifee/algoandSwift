//
//  fuelService.swift
//  algoandSwift
//
//  Created by Mario Fernandes on 23/03/2021.
//

import SwiftUI
import swift_algorand_sdk

struct fuelService: View {
    var ALGOD_API_ADDR="https://testnet-algorand.api.purestake.io/ps2"
    var ALGOD_API_TOKEN="Gxxxxxxxxxxxxxxxxxxxxxxxxx"
    var ALGOD_API_PORT=""
    
   
    @State private var transactionIsShowing = false
    
    
    var body: some View {
        
        
        ZStack(alignment: .center) {
            
            
            
            Image("fuelClean")
                
                .frame(height:UIScreen.main.bounds.height/8)
            
            
            
            Button(action: {
                
                
               
                    self.requestFuelService()
                        
               
            }) {
                Image("buyBtnBlue")
                    .padding(.leading, 190.0)
                    .padding(.top, 80.0)
                
            }
            
            
            .fullScreenCover(isPresented: $transactionIsShowing, onDismiss: {}, content: {
                algoandSwift.transaction(transactionIsShowing: $transactionIsShowing)
              })
            
            
            
        }
        
        
        
    }
    
    func  requestFuelService(){
        
        let algodClient=AlgodClient(host: ALGOD_API_ADDR, port: ALGOD_API_PORT, token: ALGOD_API_TOKEN)
        algodClient.set(key: "X-API-KeY")
        
        do {
            
            let mnemonic = "star star star star star star star star star star star star star star star star star star star star star star star star star"
            
            let account = try Account(mnemonic)
            //all fine with jsonData here
            
            let senderAddress = account.getAddress()
            let receiverAddress = try! Address("K--------------------------")
            
            
          
            
            algodClient.transactionParams().execute(){ paramResponse in
                if(!(paramResponse.isSuccessful)){
                    print(paramResponse.errorDescription!);
                    print("passou")
                    return;
                }
                
                
                let tx = try? Transaction.paymentTransactionBuilder().setSender(senderAddress)
                    .amount(1)
                    .receiver(receiverAddress)
                    .note("Swift Algo sdk is cool".bytes)
                    .suggestedParams(params: paramResponse.data!)
                    .build()
                
                
                let signedTransaction=account.signTransaction(tx: tx!)
                
                let encodedTrans:[Int8]=CustomEncoder.encodeToMsgPack(signedTransaction)
                
                
                
                algodClient.rawTransaction().rawtxn(rawtaxn: encodedTrans).execute(){
                    response in
                    if(response.isSuccessful){
                        print(response.data!.txId)
                        print("Sucesso")
//
                        transactionIsShowing = true
//
                    }else{
                        print(response.errorDescription!)
                        print("Failed")
                    }
                    
                }
            }
            
        } catch {
            //handle error
            print(error)
        }
        print("algo buy!")
    }
        
}

struct fuelService_Previews: PreviewProvider {
    static var previews: some View {
        fuelService()
    }
}
