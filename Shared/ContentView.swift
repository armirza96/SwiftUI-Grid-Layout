//
//  ContentView.swift
//  Shared
//
//  Created by abdul on 2021-01-11.
//  Phone: 514 265 3438 Email: abdul.rahman.mirza@hotmail.com

import SwiftUI

struct ItemData: Identifiable {
    var id: String
    
    let image: String
    
    // Achievement Name
    let name: String
    // Vaue of achievement like time/duration or elevation like 2095 feet
    let value: String
    
    let completed: Bool
}

struct Section: Identifiable {
    var id: String
    
    let data: [ItemData]
    
    // these are nullable cause sometimes sections dont have headers or values
    // Name of the section
    let name: String?
    // Value like '5 of 6', etc
    let value: String?
}

struct ContentView: View {

    var body: some View {
         
        NavigationView {
            ZStack {
                Rectangle().foregroundColor(Color.init(red: 99 / 255, green: 198 / 255, blue: 212 / 255)).edgesIgnoringSafeArea(.top)
                
                VStack() {
                    Spacer()
                    NavigationLink(destination: AchievementsView().navigationBarTitle("Achievements", displayMode: .inline)) {
                         Text("Show Achievements")
                    }.frame(maxWidth: .infinity)
                    
                    Spacer()
                
                }.navigationBarTitle(Text("RunKeeper Test")).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).background(Color.white)
            }
        }
    }
}

struct AchievementsView: View {
    // borrowed code from online
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        let sectionPersonalRecords: [ItemData] =
        [
            .init(id: "1", image: "longest_run", name: "Longest Run", value: "00:00",completed: true),
            .init(id: "2", image: "highest_elevation", name: "Highest Elevation", value: "2095 ft",completed: true),
            .init(id: "3", image: "fastest_5k", name: "Fastest 5k", value: "00:00",completed: true),
            .init(id: "4", image: "10k", name: "10k", value: "00:00:00",completed: true),
            .init(id: "5", image: "half_marathon", name: "Half Marathon", value: "00:00",completed: true),
            .init(id: "6", image: "marathon", name: "Marathon", value: "Not Yet",completed: false)
        ]

        let sectionVirtualRaces: [ItemData] =
        [
            .init(id: "1", image: "virtual_half_marathon_race", name: "Virtual Half Marathon Race", value: "00:00",completed: true),
            .init(id: "2", image: "Tokyo-Hakone_Ekiden_2020", name: "Tokyo-Hakone Ekiden 2020", value: "00:00:00",completed: false),
            .init(id: "3", image: "virtual_10k_race", name: "Virtual 10K Race", value: "00:00:00",completed: true),
            .init(id: "4", image: "Hakone_Ekiden", name: "Hakone Ekiden", value: "00:00:00",completed: true),
            .init(id: "5", image: "Mizuno_Singapore_Ekiden_2015", name: "Mizuno Singapore Ekiden 2015", value: "00:00:00",completed: true),
            .init(id: "6", image: "virtual_5k_race", name: "Virtual 5K Race", value: "23:07",completed: true),
        ]

        //I instantiate all of values that are static once the view is loaded
        //before I create the view because if the static values are computed as
        // the view is created it can slow down the drawing
        let countPersonalRecords = sectionPersonalRecords.filter{ item in return item.completed }.count

        let sections: [Section] = [
            .init(id: "section 1", data: sectionPersonalRecords, name: "Personal Records", value: "\(countPersonalRecords) of \(sectionPersonalRecords.count)"),
            .init(id: "section 2", data: sectionVirtualRaces, name: "Virtual Races", value: nil)
        ]

        ScrollView {
            VStack {
                ForEach(sections) { section in
                    
                  GridLayoutWithHeader(section: section)

                }
            }
        }
        
        // borrowed code from online
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image(systemName: "chevron.left")
                .foregroundColor(.blue)
                .imageScale(.large)
        },
        // end
        
        trailing: Menu {
                
                    Text("Some Option")
                
                    Text("Some Option 2")
                    Button {(
                        print("Item Pressed")
                    )
                } label: {
                    Text("Some Option 3")
                }
            } label: {
                 Image("3dots")
            }
        )

    }
}

struct GridLayoutWithHeader: View {
    let section: Section

    var body: some View {
            VStack {
                HStack {
                    if let name = section.name {
                        Text(name).foregroundColor(Color.init(red: 51.0 / 255 , green: 51.0 / 255, blue: 51.0 / 255))
                            
                            .padding(.leading, 15).padding([.bottom, .top], 10)
                            
                    }
                    
                    Spacer()
                    
                    if let value = section.value {
                        Text(value).foregroundColor(Color.init(red: 131.0 / 255, green: 149.0 / 255, blue: 167 / 255)).fontWeight(.light)
                            
                            .padding(.trailing, 15)
                            
                            .padding([.bottom, .top], 10)
                    }
                }.background(Color.init(red: 247.0 / 255, green: 247.0 / 255, blue: 247.0 / 255 ))
                
                Spacer().frame(height: 20)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 40) {
                    ForEach(section.data) { item in
                        
                        VStack(){
                            
                            
                            Image(item.image)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.bottom, 10)
                                
                            Text(item.name).font(.system(size: 14)).fontWeight(.medium).multilineTextAlignment(.center).padding(.bottom, 1).fixedSize(horizontal: false, vertical: true)
                            
                            
                            Text(item.value).fontWeight(.light)
                            
                            Spacer()
                        }.frame(width: 150, height: 180)
                        .opacity(item.completed ? 1.0 : 0.6)
                        
                    }
                }
                
                Spacer().frame(height: 20)
            }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
            
        Group {
            ContentView()

        }
        
    }
}
