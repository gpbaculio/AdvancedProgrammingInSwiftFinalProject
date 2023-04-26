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

struct ContentView: View {
    let cache = ImageCache()
    @StateObject var viewModel = MenuViewViewModel()
    @State var isShowingOptions = false
    @State private var foodFilterSelected = false
    @State private var drinkFilterSelected = false
    @State private var dessertFilterSelected = false
    
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
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .aspectRatio(1, contentMode: .fit) 
                                                    .foregroundColor(.black)
                                            },
                                            imageCache: cache
                                        )
                                        
                                        Text(item.title)
                                            .font(.system(size: 16, weight: .semibold))
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 8)
                                            .foregroundColor(.white)
                                            .background(.black)
                                            .padding(1)
                                            .lineLimit(1)
                                            .cornerRadius(10)
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
                       dessertFilterSelected: $dessertFilterSelected
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

        return items
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
