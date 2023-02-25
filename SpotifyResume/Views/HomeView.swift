//
//  HomeView.swift
//  SpotifyResume
//
//  Created by Evan Japundza on 2/22/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var ListItems = ListViewModel()
    @State private var isWESelected = false
    @State private var isEducationSelected = false
    @State private var isSISelected = false
    @State private var isSkillsSelected = false
    @State private var isProjectsSelected = false
    @State private var searchText: [String] = []
    
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
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                Color(0x191414).ignoresSafeArea()
                VStack {
                    
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
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 5) {
                            Button {
                                withAnimation {
                                    isWESelected.toggle()
                                    searchText.append("Work Experience")
                                    if !isWESelected {
                                        searchText.removeAll(where: { $0 == "Work Experience"})
                                    }
                                    
                                }
                            } label: {
                                Text("Work Experience")
                                    .minimumScaleFactor(0.8)
                            }
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(isWESelected ? Color.green : Color(0x242424))
                            .clipShape(Capsule())
                            .frame(width: 130, height: 25)
                            
                            Button {
                                withAnimation {
                                    isEducationSelected.toggle()
                                    searchText.append("Education")
                                    if !isEducationSelected {
                                        searchText.removeAll(where: { $0 == "Education"})
                                    }
                                }
                            } label: {
                                Text("Education")
                                    .minimumScaleFactor(0.8)
                            }
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(isEducationSelected ? Color.green : Color(0x242424))
                            .clipShape(Capsule())
                            .frame(width: 100, height: 25)
                            
                            Button {
                                withAnimation {
                                    isSISelected.toggle()
                                    searchText.append("Student Involvement")
                                    if !isSISelected {
                                        searchText.removeAll(where: { $0 == "Student Involvement"})
                                    }
                                }
                            } label: {
                                Text("Student Involvement")
                                    .minimumScaleFactor(0.8)
                            }
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(isSISelected ? Color.green : Color(0x242424))
                            .clipShape(Capsule())
                            .frame(width: 150, height: 25)
                            
                            Button {
                                withAnimation {
                                    isProjectsSelected.toggle()
                                    searchText.append("Projects")
                                    if !isProjectsSelected {
                                        searchText.removeAll(where: { $0 == "Projects"})
                                    }
                                }
                            } label: {
                                Text("Projects")
                                    .minimumScaleFactor(0.8)
                            }
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(isProjectsSelected ? Color.green : Color(0x242424))
                            .clipShape(Capsule())
                            .frame(width: 80, height: 25)
                            
                            Button {
                                withAnimation {
                                    isSkillsSelected.toggle()
                                    searchText.append("Skills")
                                    if !isSkillsSelected {
                                        searchText.removeAll(where: { $0 == "Skills"})
                                    }
                                }
                            } label: {
                                Text("Skills")
                                    .minimumScaleFactor(0.8)
                            }
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(isSkillsSelected ? Color.green : Color(0x242424))
                            .clipShape(Capsule())
                            .frame(width: 60, height: 25)
                            
                            
                            Spacer()
                            
                        }
                        .padding(5)
                    }
                    
                    //Spacer()
                    
                    
                    
                    
                    List {
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
