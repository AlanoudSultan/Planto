//import SwiftUI
//
//struct SetReminderView: View {
//    // State variables for the selected options
//    
//    @State private var plantName : String = ""
//    @State private var selectedRoom = "Bedroom"
//    @State private var selectedLight = "Full sun"
//    @State private var selectedWateringDays = "Every day"
//    @State private var selectedWaterAmount = "20-50 ml"
//    @Environment(\.presentationMode) var presentationMode // To close the sheet
//
//    let rooms = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
//    let lightOptions = ["Full sun", "Partial sun", "Low light"]
//    let wateringDaysOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
//    let waterAmounts = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
//    
//    var body: some View {
//        
//    
//        
//        NavigationView {
//            
//            VStack {
//                Form {
//                  
//                    Section {
//                       HStack{
//                           
//                      Text("Plant Name")
//                      TextField("Pothos", text: $plantName)
//                         .foregroundColor(plantName.isEmpty ? .gray : .primary)
//                            
//                        }
//                        
//                    }
//                    
//                    Section {
//                        // Room Picker
//                        HStack {
//                            Label("Room", systemImage: "house")
//                            Spacer()
//                            Picker(" ", selection: $selectedRoom) {
//                                ForEach(rooms, id: \.self) { room in
//                                    Text(room)
//                                }
//                            }
//                            .pickerStyle(MenuPickerStyle()) // Scrollable menu
//                            .foregroundColor(.gray)
//                        }
//                        
//                        // Light Picker
//                        HStack {
//                            Label("Light", systemImage: "sun.max")
//                            Spacer()
//                            Picker(" ", selection: $selectedLight) {
//                                ForEach(lightOptions, id: \.self) { light in
//                                    Text(light)
//                                }
//                            }
//                            .pickerStyle(MenuPickerStyle()) // Scrollable menu
//                            .foregroundColor(.gray)
//                        }
//                    }
//                    
//                    Section {
//                        // Watering Days Picker
//                        HStack {
//                            Label("Watering Days", systemImage: "drop")
//                            Spacer()
//                            Picker(" ", selection: $selectedWateringDays) {
//                                ForEach(wateringDaysOptions, id: \.self) { day in
//                                    Text(day)
//                                }
//                            }
//                            .pickerStyle(MenuPickerStyle()) // Scrollable menu
//                            .foregroundColor(.gray)
//                        }
//                        
//                        // Water Amount Picker
//                        HStack {
//                            Label("Water", systemImage: "drop")
//                            Spacer()
//                            Picker(" ", selection: $selectedWaterAmount) {
//                                ForEach(waterAmounts, id: \.self) { amount in
//                                    Text(amount)
//                                }
//                            }
//                            .pickerStyle(MenuPickerStyle()) // Scrollable menu
//                            .foregroundColor(.gray)
//                        }
//                    }
//                }
//                .navigationBarTitle("Set Reminder", displayMode: .inline)
//                .navigationBarItems(leading: Button("Cancel", action: {
//                    self.presentationMode.wrappedValue.dismiss() // Dismisses the sheet
//                }), trailing: Button("Save", action: {
//                    // Handle save action
//                }))
//            }
//        }
//    }
//}
//
//struct ContentView: View {
//    @State private var showReminderSheet = false
//    
//    var body: some View {
//        VStack {
//            Button(action: {
//                showReminderSheet.toggle()
//            }) {
//                Text("Set Reminder")
//                    .font(.title)
//                    .padding()
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//        }
//        .sheet(isPresented: $showReminderSheet) {
//            SetReminderView()
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
//





import SwiftUI

struct SetReminderView: View {
    // State variables for the selected options
    
    @State private var plantName : String = ""
    @State private var selectedRoom = "Bedroom"
    @State private var selectedLight = "Full sun"
    @State private var selectedWateringDays = "Every day"
    @State private var selectedWaterAmount = "20-50 ml"
    @Environment(\.presentationMode) var presentationMode // To close the sheet

    let rooms = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    let lightOptions = ["Full sun", "Partial sun", "Low light"]
    let wateringDaysOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterAmounts = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        HStack {
                            Text("Plant Name").foregroundColor(.white)
                            TextField("Pothos", text: $plantName)
                                .foregroundColor(plantName.isEmpty ? .gray : .white)
                        }
                    }
                    
                    Section {
                        // Room Picker
                        HStack {
                            Label("Room", systemImage: "house").foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedRoom) {
                               
                                ForEach(rooms, id: \.self) { room in
                                    Text(room)
                                        .foregroundColor(.white)
                                }
                            }
                            .pickerStyle(MenuPickerStyle()) // Scrollable menu
                        }
                        
                        // Light Picker
                        HStack {
                            Label("Light", systemImage: "sun.max").foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedLight) {
                                ForEach(lightOptions, id: \.self) { light in
                                    Text(light).foregroundColor(.white)
                                }
                            }
                            .pickerStyle(MenuPickerStyle()) // Scrollable menu
                        }
                    }
                    
                    Section {
                        // Watering Days Picker
                        HStack {
                            Label("Watering Days", systemImage: "drop").foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedWateringDays) {
                                ForEach(wateringDaysOptions, id: \.self) { day in
                                    Text(day).foregroundColor(.white)
                                }
                            }
                            .pickerStyle(MenuPickerStyle()) // Scrollable menu
                        }
                        
                        // Water Amount Picker
                        HStack {
                            Label("Water", systemImage: "drop").foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedWaterAmount) {
                                ForEach(waterAmounts, id: \.self) { amount in
                                    Text(amount).foregroundColor(.white)
                                }
                            }
                            .pickerStyle(MenuPickerStyle()) // Scrollable menu
                        }
                    }
                }
                .background(Color("darkgray"))
                .scrollContentBackground(.hidden) // Ensures the entire form background is dark
                .navigationBarTitle("Set Reminder", displayMode: .inline)
                
                .navigationBarItems(leading: Button("Cancel", action: {
                    self.presentationMode.wrappedValue.dismiss() // Dismisses the sheet
                }).foregroundColor(.green), trailing: Button("Save", action: {
                    // Handle save action
                }).foregroundColor(.green))
            }
            .background(Color("darkgray")) // Dark mode background for the entire view
        }
    }
}

struct ContentView: View {
    @State private var showReminderSheet = false
    
    var body: some View {
        VStack {
            Button(action: {
                showReminderSheet.toggle()
            }) {
                Text("Set Reminder")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .background(Color.black) // Dark mode background for the main content view
        .sheet(isPresented: $showReminderSheet) {
            SetReminderView()
        }
    }
}

#Preview {
    ContentView()
}
