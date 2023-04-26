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
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Second Screen")
                    .font(.largeTitle)
                    .padding()
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
