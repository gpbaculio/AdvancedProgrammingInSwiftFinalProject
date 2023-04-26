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
                Text("Selected Categories").font(.system(size: 16, weight: .semibold))
                Toggle(isOn: $foodFilterSelected) {
                    Text("Food").font(.system(size: 16, weight: .medium))
                }
                Toggle(isOn: $drinkFilterSelected) {
                    Text("Drink").font(.system(size: 16, weight: .medium))
                }
                Toggle(isOn: $dessertFilterSelected) {
                    Text("Dessert").font(.system(size: 16, weight: .medium))
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
            .padding()
        }
    }
}
