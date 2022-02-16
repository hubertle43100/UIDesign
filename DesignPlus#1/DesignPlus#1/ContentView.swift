//
//  ContentView.swift
//  DesignPlus#1
//
//  Created by Hubert Le on 2/10/22.
//

import SwiftUI
//4. Create priority
enum Priority: String, Identifiable, CaseIterable {
    
    var id: UUID {
        return UUID()
    }
    
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

//5. Extent the enum Priority to make UI flexible
extension Priority {
    var title: String {
        switch self {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
}


struct ContentView: View {
    
    @State private var title: String = ""
    @State private var selectedPriority: Priority = .medium
    @Environment(\.managedObjectContext) private var viewContext
    //8. Get fetch request to retrieve data
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)]) private var allTasks: FetchedResults<Task>
    //7. provide action for save button
    private func saveTask() {
        
        do {
            let task = Task (context: viewContext)
            task.title = title
            task.priority = selectedPriority.rawValue
            task.dateCreated = Date()
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    var body: some View {
        //3. Start decorating view
        NavigationView {
            VStack {
                
                TextField("Enter title", text: $title)
                //6. create Picker & Button
                Picker("Priority", selection: $selectedPriority) {
                    ForEach(Priority.allCases) { priority in
                        Text(priority.title).tag(priority)
                    }
                }.pickerStyle(.segmented)
                Button("Save") {
                    saveTask()
                }.padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                
                //9. Use the Fetched data
                List {
                    ForEach(allTasks) { task in
                        Text(task.title ?? "")
                    }
                }
                Spacer()
            }.navigationTitle("All Tasks")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
