//
//  ContentView.swift
//  comuline
//
//  Created by mac on 10/8/24.
//

import SwiftUI

struct ContentView: View {
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
                        
                        StationView(name: "Duri", destinations: [])
                        
                        StationView(name: "Tanah Abang", destinations: [
                            Destination(name: "Angke", via: "Via Manggarai", platform: "Peron 2", eta: nil),
                            Destination(name: "Rangkasbitung", via: nil, platform: "Peron 5", eta: nil),
//                            Destination(name: "Bekasi", via: nil, eta: nil)
                        ])
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Cari stasiun krl...", text: $text)
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
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
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
