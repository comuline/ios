//
//  ContentView.swift
//  comuline
//
//  Created by mac on 10/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = StationListViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
                Text("Stasiun Favorit Anda")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 10) {
                        StationView(name: "Kranji", destinations: [
                            Destination(name: "Jakarta Kota", via: "Via Pasar Senen", platform: "Peron 4", eta: nil),
//                            Destination(name: "Manggarai", via: "Via Manggarai", eta: "10 Menit"),
//                            Destination(name: "Cikarang", via: "Via Manggarai", eta: "10 Menit")
                        ])
//                        StationView(name: "Duri", destinations: [])
                        
                        StationView(name: "Tanah Abang", destinations: [
                            Destination(name: "Angke", via: "Via Manggarai", platform: "Peron 2", eta: nil),
                            Destination(name: "Rangkasbitung", via: nil, platform: "Peron 5", eta: nil),
//                            Destination(name: "Bekasi", via: nil, eta: nil)
                        ])
                    }
                    NavigationView {
                        VStack {
                            NavigationLink(destination: StationListView()) {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Tambah stasiun lain")
                                        .font(.system(size: 17))
                                        }
                                .frame(maxWidth: .infinity)

                                        .padding()
                                        .background(Color(white: 0.20))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }


//struct AddStationView: View {
//    var body: some View {
//        Text("Add New Station")
//            .navigationTitle("Add Station")
//    }
//}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Cari stasiun keberangkatan", text: $text)
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct AddStation: View {
    var body: some View {
        Button(action: {
            // Action to perform when button is tapped
            print("Add another station")
        }) {
            HStack {
                Image(systemName: "plus")
                Text("Tambah stasiun lain")
                    .font(.system(size: 17))
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(white: 0.2))
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .background(Color.white)
    }
}


struct StationView: View {
    let name: String
    let destinations: [Destination]
    @State private var isExpanded = true
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name)
                    .font(.headline)
                Spacer()
                Button(action: { isExpanded.toggle() }) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
                Button(action: {}) {
                    Image(systemName: "arrow.clockwise")
                }
            }
            .padding(.horizontal)
            
            if isExpanded {
                ForEach(destinations, id: \.name) { destination in
                    DestinationView(destination: destination)
                }
            }
        }
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct DestinationView: View {
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(destination.name)
                .font(.subheadline)
                .fontWeight(.semibold)
            if let via = destination.via {
                Text(via)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            HStack {
                if let platform = destination.platform {
                    Text(platform)
                }
                Spacer()
                if let eta = destination.eta {
                    Text(eta)
                }
            }
            .font(.caption)
            .foregroundColor(.secondary)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}


struct Destination {
    let name: String
    let via: String?
    let platform: String?
    let eta: String?
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//import SwiftUI
//
//// Model
//struct TodoItem: Identifiable {
//    let id = UUID()
//    var title: String
//    var isCompleted: Bool
//}
//
//// ViewModel
//class TodoListViewModel: ObservableObject {
//    @Published var items: [TodoItem] = []
//    
//    func addItem(title: String) {
//        let newItem = TodoItem(title: title, isCompleted: false)
//        items.append(newItem)
//    }
//    
//    func toggleCompletion(for item: TodoItem) {
//        if let index = items.firstIndex(where: { $0.id == item.id }) {
//            items[index].isCompleted.toggle()
//        }
//    }
//}
//
//// View
//struct ContentView: View {
//    @StateObject private var viewModel = TodoListViewModel()
//    @State private var newItemTitle = ""
//    
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(viewModel.items) { item in
//                    HStack {
//                        Text(item.title)
//                        Spacer()
//                        if item.isCompleted {
//                            Image(systemName: "checkmark")
//                        }
//                    }
//                    .onTapGesture {
//                        viewModel.toggleCompletion(for: item)
//                    }
//                }
//                
//                HStack {
//                    TextField("New item", text: $newItemTitle)
//                    Button(action: {
//                        if !newItemTitle.isEmpty {
//                            viewModel.addItem(title: newItemTitle)
//                            newItemTitle = ""
//                        }
//                    }) {
//                        Image(systemName: "plus.circle.fill")
//                    }
//                }
//            }
//            .navigationTitle("ToDo List")
//        }
//    }
//}
//
//// Preview
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

