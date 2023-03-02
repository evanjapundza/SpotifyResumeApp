//
//  HomeView.swift
//  SpotifyResume
//
//  Created by Evan Japundza on 2/22/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var ListItems = ListViewModel()
    @State private var isSelected = false
    @State private var searchText: [String] = []
    @State private var searchTextTwo: String = ""
    var typeList: [String] = ["Work Experience", "Education", "Student Involvement", "Projects", "Skills"]
    
    var filteredItems: [ListItem] {
        
        if searchText.isEmpty {
            return ListItems.listItems
        } else {
            return ListItems.listItems.filter { item in
                for term in searchText {
                    if !item.type.localizedCaseInsensitiveContains(term) {
                        return false
                    }
                }
                return true
            }
        }
        
    }
    
    var filteredButtons: [String] {
            if searchTextTwo.isEmpty {
                return typeList
            } else {
                return typeList.filter { $0.localizedCaseInsensitiveContains(searchTextTwo) }
            }
        }
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                Color(0x191414).ignoresSafeArea()
                VStack { // Contains all header items
                    
                    HStack {
                        Image("Me")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Evan Japundza's Resume")
                                .foregroundColor(.white)
                            
                            HStack {
                                Text("evjapund@iu.edu")
                                Text("·")
                                Text("(765) 434-1755")
                                
                            }
                            .foregroundColor(.gray)
                            .font(.footnote)
                            
                            Text("github.com/evanjapundza")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            Text("linkedin.com/evan-japundza")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                        }
                        
                        Spacer()
                        
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) { //This scrollview is for the filter buttons

                        HStack(spacing: 15) {
                            
                            ForEach(filteredButtons, id: \.self) { type in
                                
                                Button {
                                    withAnimation {
                                        searchTextTwo = type
                                        isSelected.toggle()
                                        searchText.append(type)
                                        if !isSelected {
                                            searchText.removeAll(where: { $0 == type})
                                            searchTextTwo = ""
                                        }
                                        
                                    }
                                } label: {
                                    Text(type)
                                        .minimumScaleFactor(0.8)
                                    
                                }
                                .padding(10)
                                .foregroundColor(Color.white)
                                .background(isSelected ? Color.green : Color(0x242424))
                                .clipShape(Capsule())
                                
                            }

                            Spacer()
                            
                        }
                        .padding(5)
                    }
                    
                    List { //List of items, all filtered
                        ForEach(filteredItems, id:\.self) { item in
                            NavigationLink {
                                ItemView(listItem: item)
                            } label: {
                                HStack {
                                    
                                    Image(item.image)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.title)
                                            .foregroundColor(Color.white)
                                        
                                        HStack {
                                            Text(item.company)
                                                .foregroundColor(Color.gray)
                                                .font(.footnote)
                                            
                                            Text("·")
                                                .foregroundColor(Color.gray)
                                            
                                            Text(item.type)
                                                .foregroundColor(Color.gray)
                                                .font(.footnote)
                                        }
                                        
                                    }
                                    
                                    Spacer()
                                }
                                .padding(7)
                                .listRowBackground(Color.clear)
                            }
                            .listRowBackground(Color.clear)
                        }
                        
                    }
                    .listStyle(.plain)
                    .background(Color.clear)
                    
                    Spacer()
                    
                }
                
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}
