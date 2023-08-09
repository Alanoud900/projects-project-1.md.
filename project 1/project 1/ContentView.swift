
//  ContentView.swift
//  project 1
//  Created by Alanoud  on 16/01/1445 AH.
import SwiftUI
/*enum Priority: Codable {
    case LOW
    case MEDIUM
    case HIGH
}

enum Status: Codable {
    case Backlog
    case Todo
    case InProgress
    case Done
}*/

     
struct ContentView: View {
    
    // @ObservedObject var vm = ViewModel()
    @State var text: Array<String> = []
    @State var showsheet = false
    @State var textitemtemp = ""
  //  @State var searchedText: String = ""
    let taskStatusList = ["Backlog", "ToDo", "In-Progress", "Done"]
    var body: some View {
        NavigationView {    //here
            Group {
                if text.count <= 1 {
                    Text("No item")
                } else {
                    List {
                        ForEach((1...text.count-1), id: \.self) { i in
                            Text(text[i])
                                .contextMenu {
                                    Button(action: {
                                        text.remove(at: i)
                                    }, label: {
                                        Label("Delete", systemImage: "delete.left")
                                    })
                                }
                        }
                    }
                }
            }
            .navigationTitle("Reminder")
            .toolbar {
                Button(action: {
                    showsheet.toggle()
                    textitemtemp = ""
                    
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .onChange(of: text) { _ in
                save()
                load()
            }
            .onAppear() {
                save()
                load()
            }
            .refreshable {
                save()
                load()
            }
        }
        .sheet(isPresented: $showsheet) {
            NavigationView {
                List {
                    TextField("item", text: $textitemtemp)
                }
                .navigationTitle("Add a item")
                .toolbar {
                    Button("add") {
                        text.append(textitemtemp)
                        showsheet.toggle()
                    }
                }
            }
        }//here
       
        .background(Image("book"))
        .padding()
    }
            
              func save() -> Void {
                let temp = text.joined(separator: "/[split]/")
                let key = UserDefaults.standard
                key.set(temp, forKey: "text")
            }
            func load() -> Void {
                let key = UserDefaults.standard
                let temp = key.string(forKey: "text") ?? ""
                let temparray = temp.components(separatedBy: "/[split]/")
                text = temparray
            }
        }
    

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


    
