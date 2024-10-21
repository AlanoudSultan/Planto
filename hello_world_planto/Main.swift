//
//  Main.swift
//  hello_world_planto
//
//  Created by Alanoud Abaalkhail on 18/04/1446 AH.
//

import SwiftUI

struct Main: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading){
                Text("My Plants 🌱 ")
                    .font(.system(size: 34))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .background(Color.gray)
                     Spacer()
                Image("plant")
                    .resizable()
                    .frame(width: 164.0,height: 200.0)
                    .position(x:200 , y:140)
                   
                
                Text("Start your plant journey! ")
                    .foregroundColor(Color("whitish"))
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .position(x:200 , y: 130)
                
                Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                    .foregroundStyle(Color("grayish"))
                    .position(x:200 , y: 14)
                
                Button("Set Plant Reminder") {
                   
                }
                .frame(width: 280 , height: 40)
                .foregroundColor(Color("blacks"))
                .background(Color("green"))
                .cornerRadius(10)
                .position(x:200 , y: -100)
                

                    
                
            }
            
        }
    }
}

#Preview {
    Main()
}
