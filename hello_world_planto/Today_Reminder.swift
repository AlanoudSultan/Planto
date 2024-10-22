import SwiftUI

struct Today_Reminder: View {
    
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
                
                
                HStack(){
                    ZStack{
                        Button(action: {
                            
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 60, height: 33)
                                .background(Color("green"))
                                .foregroundColor(Color("blacks"))
                                .clipShape(Circle())
                                .shadow(radius: 10)
                        }
                    }
                    
                    Text("New Reminder")
                        .foregroundColor(Color("green"))
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                    
                    
                    
                }
            }
            }
        }
    }

        #Preview {
            Today_Reminder()
        }
    
