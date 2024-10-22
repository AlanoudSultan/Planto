import SwiftUI

struct completed_reminders: View {
    
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
                
                Image("winkPlant")
                    .resizable()
                    .frame(width: 219,height: 227.0)
                    .position(x:200 , y:227)
                   
                
                Text("All Done! 🎉 ")
                    .foregroundColor(Color("whitish"))
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .position(x:200 , y: 180)
                
                Text("All Reminders Completed")
                    .foregroundStyle(Color("grayish"))
                    .position(x:200 , y: 1)
                
           
                
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
            completed_reminders()
        }
    

