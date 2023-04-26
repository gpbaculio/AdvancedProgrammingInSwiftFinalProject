//
//  ContentView.swift
//  AdvancedProgrammingInSwiftFinal
//
//  Created by Glendon Philipp Baculio on 4/26/23.
//

import SwiftUI
import UIKit
import Combine

let categories = ["Food", "Drinks", "Dessert"]

let mainColor =  Color(
     red: 73/255,
     green: 94/255,
     blue: 97/255,
     opacity: 1
 )

 let secondaryColor =  Color(
     red: 244/255,
     green: 206/255,
     blue: 20/255,
     opacity: 1
 )

struct ContentView: View {
    let cache = ImageCache()
    @StateObject var viewModel = MenuViewViewModel()
    @State var isShowingOptions = false
    @State private var foodFilterSelected = false
    @State private var drinkFilterSelected = false
    @State private var dessertFilterSelected = false
    @State private var sortByPrice = false
    @State private var sortAlphabetically = false
    @State private var popular = false
    
    var body: some View {
        let gridItem = GridItem(.flexible())
        NavigationView {
            ScrollView {
                ForEach(categories.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(categories[index])
                            .font(.system(size: 21, weight: .bold))
                            .padding(.leading, 20)
                        
                        LazyVGrid(
                            columns: [gridItem, gridItem, gridItem],
                            alignment: .center,
                            spacing: 10
                        ) {
                            let currentItem = menuItems(forCategoryIndex: index)
                            
                            ForEach(currentItem, id: \.id) { item in
                                NavigationLink(destination: MenuItemDetailsView(item: item)) {
                                    VStack {
                                        AsyncImage(
                                            url: URL(string: item.image)!,
                                            placeholder: {
                                                Image("Little Lemon logo")
                                                    .resizable()
                                                    .aspectRatio(1, contentMode: ContentMode.fit)
                                                    .frame(maxWidth: .infinity)
                                                    .scaledToFill()
                                                    .padding()
                                                    .border(mainColor,width: 1)
                                            },
                                            imageCache: cache
                                        )
                                        
                                        Text(item.title)
                                            .font(.system(size: 16, weight: .semibold))
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 8)
                                            .foregroundColor(secondaryColor)
                                            .background(mainColor)
                                            .padding(1)
                                            .lineLimit(1)
                                    } 
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Menus")
            .navigationBarItems(
                trailing: Button(action: {
                    self.isShowingOptions = true
                }) {
                    Image(systemName: "gearshape")
                }
                .sheet(isPresented: $isShowingOptions) {
                    MenuItemOptionsView(
                       foodFilterSelected: $foodFilterSelected,
                       drinkFilterSelected: $drinkFilterSelected,
                       dessertFilterSelected: $dessertFilterSelected,
                       sortByPrice: $sortByPrice,
                       sortAlphabetically: $sortAlphabetically,
                       popular: $popular
                   )
                }
            )
        }
    }
    
    func menuItems(forCategoryIndex index: Int) -> [MenuItem] {
        var items = [MenuItem]()

        switch index {
            case 0:
                items = viewModel.foodItems
            case 1:
                items = viewModel.drinkItems
            case 2:
                items = viewModel.dessertItems
            default:
                break
        }
        
        if foodFilterSelected || drinkFilterSelected || dessertFilterSelected {
            items = items.filter { item in
                var shouldInclude = false
                
                if foodFilterSelected && item.menuCategory.rawValue == "Food" {
                    shouldInclude = true
                }
                
                if drinkFilterSelected && item.menuCategory.rawValue == "Drink" {
                    shouldInclude = true
                }
                
                if dessertFilterSelected && item.menuCategory.rawValue == "Dessert" {
                    shouldInclude = true
                }
                
                return shouldInclude
            }
        }
        
        if sortByPrice {
             items.sort { $0.price < $1.price }
        }
        if sortAlphabetically {
            items.sort { $0.title < $1.title }
        }
        if popular {
            items.sort { $0.ordersCount < $1.ordersCount }
        }

        return items
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
