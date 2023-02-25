//
//  ItemView.swift
//  SpotifyResume
//
//  Created by Evan Japundza on 2/24/23.
//

import SwiftUI
import Foundation

struct ItemView: View {
    
    var listItem: ListItem
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    func getOffsetY(reader: GeometryProxy) -> CGFloat {
        let offsetY: CGFloat = -reader.frame(in: .named("scrollView")).minY
        if offsetY < 0 {
            return offsetY / 1.3
        }
        return offsetY
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                
                GeometryReader { reader in
                    
                    let offsetY = getOffsetY(reader: reader)
                    let height: CGFloat = (reader.size.height - offsetY) + offsetY / 3
                    let minHeight: CGFloat = 120
                    let opacity = (height - minHeight) / (reader.size.height - minHeight)
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.50), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                            .scaleEffect(2.7)
                        
                        Image(listItem.image)
                            .resizable()
                            .frame(width: height > 0 ? height : 0, height: height > 0 ? height : 0)
                            .offset(y: offsetY)
                            .opacity(opacity)
                            .shadow(color: Color.black.opacity(0.5), radius: 30)
                        
                    }
                    .frame(width: reader.size.width)
                }
                .frame(height: 250)
                
                itemHeaderView
                    .padding(.horizontal)
                
                itemDescriptionsView
                    .padding(.horizontal)
                
                
            }
            .navigationBarTitle(Text(listItem.type))
            .coordinateSpace(name: "scrollView")
            .background(Color(0x191414).ignoresSafeArea())
        }
        .toolbarBackground(Color(0x191414), for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
        })
        
    }
    
    var itemDescriptionsView: some View {
        ForEach(listItem.descriptions, id: \.self) { description in
            
            HStack {
                Text(description)
                    .minimumScaleFactor(0.5)
    
                
                Spacer()
            }
            .frame(height: 60)
            .foregroundColor(.white)
            
        }
    }
    
    var itemHeaderView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(listItem.title)
                    .font(.title)
                    .bold()
                
                HStack {
                    Image(listItem.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(listItem.company)
                            .font(.title2)
                            .bold()
                }
                
                Text(listItem.date)
                
                
            }
            .foregroundColor(.white)
            
            Spacer()
            
            
        }
    }
    
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(listItem: ListItem(company: "Testing Company", type: "Testing Type", title: "Testing Title", date: "Testing Date", image: "highres", descriptions: ["Description 1", "Description 2", "Description 3"]))
    }
}
