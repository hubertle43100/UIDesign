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
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "isFavorite", ascending: true)]) private var allTasks: FetchedResults<Task>
    
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
    
    //11. adding func for priority
    private func styleForPriority(_ value: String) -> Color {
        let priority = Priority(rawValue: value)
        
        switch priority {
        case .low:
            return Color.green
        case .medium:
            return Color.orange
        case .high:
            return Color.red
        default:
            return Color.gray
        }
    }
    //12. adding updateTask
    private func updateTask(_ task: Task) {
        
        task.isFavorite = !task.isFavorite
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //13. adding deleteTask
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = allTasks[index]
            viewContext.delete(task)
            
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    private func crossTask(_ task: Task) {
        
        task.isCrossed = !task.isCrossed

        do {
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
                    .padding(.bottom)
                //6. create Picker & Button
                Picker("Priority", selection: $selectedPriority) {
                    ForEach(Priority.allCases) { priority in
                        Text(priority.title).tag(priority)
                    }
                }.pickerStyle(.segmented)
                Button("Save") {
                    saveTask()
                    title = ""
                }.padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                
                //9. Use the Fetched data
                List {
                    ForEach(allTasks) { task in
                        HStack {
                            Circle()
                                .fill(task.isCrossed ? styleForPriority("") : styleForPriority(task.priority!))
                                .frame(width: 15, height: 15)
                            Spacer().frame(width: 20)
                            Text(task.title ?? "")
                                .strikethrough(task.isCrossed)
                                .foregroundColor(task.isCrossed ? Color.gray : Color.black)
                            Spacer()
                            Image(systemName: task.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(task.isCrossed ? .gray : .red)
                                .onTapGesture {
                                    updateTask(task)
                                }
                        }.onTapGesture {
                            crossTask(task)
                        }
                    }.onDelete(perform: deleteTask)
                        .onMove { (indexSet, index) in
                            
                        }
                }
                .toolbar {
                    EditButton()
                        .foregroundColor(.black)
                }
                Spacer()
            }.navigationTitle("My TO-DO list").padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //10. Just inject viewContext in ContentView
        let persistedContainer = CoreDataManager.shared.persistentContainer
        ContentView().environment(\.managedObjectContext, persistedContainer.viewContext)
    }
}
