
import SwiftUI

struct SetReminderView: View {
   
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
                                .tint(Color("green"))
                        }
                    }
                    
                    Section {
                        HStack {
                            Label("Room", systemImage: "location")
                                .foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedRoom) {
                                ForEach(rooms, id: \.self) { room in
                                    Text(room)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Label("Light", systemImage: "sun.max")
                                .foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedLight) {
                                ForEach(lightOptions, id: \.self) { light in
                                    Text(light)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    
                    Section {
                        HStack {
                            Label("Watering Days", systemImage: "drop")
                                .foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedWateringDays) {
                                ForEach(wateringDaysOptions, id: \.self) { day in
                                    Text(day)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Label("Water", systemImage: "drop")
                                .foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedWaterAmount) {
                                ForEach(waterAmounts, id: \.self) { amount in
                                    Text(amount)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                }
                .accentColor(.gray)
                
                .navigationBarTitle("Set Reminder", displayMode: .inline)
                
                .navigationBarItems(leading: Button("Cancel", action: {
                    self.presentationMode.wrappedValue.dismiss() // Dismisses the sheet
                    
                }).foregroundColor(Color("green")), trailing: Button("Save", action: {
                    saveReminder()
                    self.presentationMode.wrappedValue.dismiss() // Dismisses the sheet after saving
                }).foregroundColor(Color("green")))
            }
        }
    }
    
    private func saveReminder() {
        // Logic to save the reminder data
        let reminder = Reminder(plantName: plantName, room: selectedRoom, light: selectedLight, wateringDays: selectedWateringDays, waterAmount: selectedWaterAmount)
        ReminderStore.shared.addReminder(reminder)
    }
}

struct Reminder: Identifiable {
    let id = UUID()
    let plantName: String
    let room: String
    let light: String
    let wateringDays: String
    let waterAmount: String
}

class ReminderStore: ObservableObject {
    static let shared = ReminderStore()
    @Published private(set) var reminders: [Reminder] = []
    @Published var selectedReminderIds: Set<UUID> = []
    
    private init() {}
    
    func addReminder(_ reminder: Reminder) {
        reminders.append(reminder)
        print("Reminder saved: \(reminder)")
    }
}

import SwiftUI

struct Today_Reminder: View {
    @State private var showReminderSheet = false
    @ObservedObject var reminderStore = ReminderStore.shared
    
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
                
                Text("Today")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                List {
                    ForEach(reminderStore.reminders) { reminder in
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Label(reminder.room , systemImage: "location")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            HStack {
                                Image(systemName: reminderStore.selectedReminderIds.contains(reminder.id) ? "checkmark.circle.fill" : "circle")
                                    .font(.system(size: 30)) // Increase the size to make the checkmark larger
                                    .foregroundColor(reminderStore.selectedReminderIds.contains(reminder.id) ? Color("green") : .gray)
                                    .onTapGesture {
                                        if reminderStore.selectedReminderIds.contains(reminder.id) {
                                            reminderStore.selectedReminderIds.remove(reminder.id)
                                        } else {
                                            reminderStore.selectedReminderIds.insert(reminder.id)
                                        }
                                    }
                                
                                Text(reminder.plantName)
                                    .font(.system(size: 28, weight: .bold)) // Increase the size to make the plant name larger
                                    .foregroundColor(.white)
                            }

                           
                            HStack {
                                Label(reminder.light, systemImage: "sun.max")
                                    .foregroundColor(Color("yellow"))
                                Label(reminder.waterAmount, systemImage: "drop")
                                    .foregroundColor(Color("blue"))
                            }
                        }
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.black)
                
                Spacer()
                
                HStack(){
                    ZStack{
                        Button(action: {
                            showReminderSheet.toggle()
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 30.0, height: 60)
                                .background(Color("green"))
                                .foregroundColor(.black)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                        }
                    }.sheet(isPresented: $showReminderSheet) {
                        SetReminderView()
                    }
                    
                    Text("New Reminder")
                        .foregroundColor(Color("green"))
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                }
            }
            .padding()
        }
    }
}

#Preview {
    Today_Reminder()
}
