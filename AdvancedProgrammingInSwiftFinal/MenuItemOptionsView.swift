//
//  MenuItemOptionsView.swift
//  AdvancedProgrammingInSwiftFinal
//
//  Created by Glendon Philipp Baculio on 4/26/23.
//

import SwiftUI
import UIKit
import Combine
import Foundation

struct MenuItemOptionsView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var foodFilterSelected: Bool
    @Binding var drinkFilterSelected: Bool
    @Binding var dessertFilterSelected: Bool
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Second Screen")
                    .font(.largeTitle)
                    .padding()
                Toggle(isOn: $foodFilterSelected) {
                    Text("Food")
                }
                Toggle(isOn: $drinkFilterSelected) {
                    Text("Drink")
                }
                Toggle(isOn: $dessertFilterSelected) {
                    Text("Dessert")
                }
            }
            .navigationBarTitle("Filter")
            .navigationBarItems(
                trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done")
                }
            )
        }
    }
}
