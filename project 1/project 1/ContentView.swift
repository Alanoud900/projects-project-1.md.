
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

struct MyList: View{
    @State var title: String
    @State var notes: String
    var body: some View{
        VStack{
            Form{
                Section{
                    List{
                        Text(title)
                        Text(notes)
                    }
                }
            }
        }
    }
}
struct ContentView: View{
    
    @ObservedObject var vm = ViewModel()
    
    @State var searchedText: String = ""
    @State var reminderText: String = ""
   
    // @State var TitelText: String = ""
    // @State var NotesText: String = ""
    // @AppStorage("NotesText") var NotesText = ""
    // @AppStorage("TitelText") var TitelText = ""
    var body: some View {
        NavigationStack{
            
            VStack {   // Status->Start app
                
                TextField("Search", text: $searchedText)
                    .frame(height: 40)
                
                    .padding(.vertical, 8)
                    .padding(.horizontal, 4)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(12)
                Spacer()
                Text("My Lists")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .lineLimit(/*@START_MENU_TOKEN@*/18/*@END_MENU_TOKEN@*/)
                    .padding(.leading, -161.0)
                
                
                HStack{
                    ZStack{
                        
                        NavigationLink( destination:{
                            Form{
                                Section{
                                    TextField("Title", text: $vm.textFildeTitle)
                                    TextField("Notes", text: $vm.textFildeNotes)
                                        .padding(.vertical, 40)
                                        .padding(.horizontal, 4)
                                }
                            }
                            
                            NavigationLink(destination: {
                                TextField("Search", text: $searchedText)
                                    .frame(height: 40)
                                
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 4)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(12)
                                Spacer()
                                MyList(title: vm.textFildeTitle, notes: vm.textFildeNotes)
                                MyList(title: vm.textFildeTitle, notes: vm.textFildeNotes)
                                    .onDelete(perform: removeRows)
                            }, label: {
                                Text("Next")
                            })
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            
                            Button(action: {
                                vm.addtoList(titel: vm.textFildeTitle, notes: vm.textFildeNotes)
                            }, label: {
                                Text("Save")
                            })
                            
                            
                            
                        }, label:{
                            RoundedRectangle(cornerRadius: 18.0)
                            
                                .foregroundColor(.indigo)
                                .frame(width: 180,height: 100)
                            Spacer()
                        })
                        .padding(.top)
                        Text("Backlog")
                            .foregroundColor(.white)
                    }
                    
                    
                    ZStack{
                        
                        NavigationLink( destination:{
                            Form{
                                Section{
                                    TextField("Title", text: $vm.textFildeTitle)
                                    TextField("Notes", text: $vm.textFildeNotes)
                                        .padding(.vertical, 40)
                                        .padding(.horizontal, 4)
                                }
                            }
                            NavigationLink(destination: {
                                TextField("Search", text: $searchedText)
                                    .frame(height: 40)
                                
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 4)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(12)
                                Spacer()
                                MyList(title: vm.textFildeTitle, notes: vm.textFildeNotes)
                                MyList(title: vm.textFildeTitle, notes: vm.textFildeNotes)
                                    .onDelete(perform: removeRows)
                            }, label: {
                                Text("Next")
                            })
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            
                        
                            Button(action: {
                                vm.addtoList(titel: vm.textFildeTitle, notes: vm.textFildeNotes)
                            }, label: {
                                Text("Save")
                            })
                            
                        }, label:{
                            RoundedRectangle(cornerRadius:18.0)
                                .foregroundColor(.indigo)
                                .frame(width: 180,height: 100)
                        })
                        Text("Todo")
                            .foregroundColor(.white)
                    }
                    
                }
                
                HStack {
                    ZStack{
                        
                        NavigationLink( destination:{
                            Form{
                                Section{
                                    TextField("Title", text: $vm.textFildeTitle)
                                    TextField("Notes", text: $vm.textFildeNotes)
                                        .padding(.vertical, 40)
                                        .padding(.horizontal, 4)
                                }
                            }
                            NavigationLink(destination: {
                                TextField("Search", text: $searchedText)
                                    .frame(height: 40)
                                
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 4)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(12)
                                Spacer()
                                MyList(title: vm.textFildeTitle, notes: vm.textFildeNotes)
                                MyList(title: vm.textFildeTitle, notes: vm.textFildeNotes)
                                    .onDelete(perform: removeRows)
                            }, label: {
                                Text("Next")
                            })
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            
                            
                            Button(action: {
                                vm.addtoList(titel: vm.textFildeTitle, notes: vm.textFildeNotes)
                            }, label: {
                                Text("Save")
                            })
                            
                        }, label:{
                            RoundedRectangle(cornerRadius: 18.0)
                            
                                .foregroundColor(.indigo)
                                .frame(width: 180,height: 100)
                            Spacer()
                        })
                        Text("In-Progress")
                            .foregroundColor(.white)
                    }
                    
                    ZStack{
                        
                        NavigationLink( destination:{
                            Form{
                                Section{
                                    TextField("Title", text: $vm.textFildeTitle)
                                    TextField("Notes", text: $vm.textFildeNotes)
                                        .padding(.vertical, 40)
                                        .padding(.horizontal, 4)
                                }
                            }
                            NavigationLink(destination: {
                                TextField("Search", text: $searchedText)
                                    .frame(height: 40)
                                
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 4)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(12)
                                Spacer()
                                MyList(title: vm.textFildeTitle, notes: vm.textFildeNotes)
                                MyList(title: vm.textFildeTitle, notes: vm.textFildeNotes)
                                    .onDelete(perform: removeRows)
                            }, label: {
                                Text("Next")
                            })
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            
                            Button(action: {
                                vm.addtoList(titel: vm.textFildeTitle, notes: vm.textFildeNotes)
                            }, label: {
                                Text("Save")
                            })
                            
                        }, label:{
                            RoundedRectangle(cornerRadius:18.0)
                                .foregroundColor(.indigo)
                                .frame(width: 180,height: 100)
                        })
                        Text("Done")
                            .foregroundColor(.white)
                    }
                    
                }
                NavigationStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    NavigationLink(
                        destination: {
                            Form{
                                Section{
                                    TextField("Title", text: $vm.textFildeTitle)
                                    TextField("Notes", text: $vm.textFildeNotes)
                                        .padding(.vertical, 40)
                                        .padding(.horizontal, 4)
                                }
                            }
                        }, label: {
                            
                            HStack{
                                
                                Image(systemName: "swift")
                                Text("Add New Reminder")
                            }
                        })
                    
                }
            }
        }
        .padding()
        
    }
}
func removeRows(at offsets:IndexSet) {
    MyList.remove(atOffsets: offset)
}
   
func filterCardBasedOn(_ value: String) {
    if value.isEmpty {
        filteNoteData = notes
    } else {let lowercasedValue = value.lowercased()
        filteNoteData = notes.filter({notes in
            return card.title.lowercased().contains(lowercasedValue)}
                                      
        )}
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

//@AppStorage("isDarkMode") private var isDarkMode = false
//    .preferredColorScheme(.light)

