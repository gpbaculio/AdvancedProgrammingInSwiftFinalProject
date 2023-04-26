//
//  MenuItemDetailsView.swift
//  AdvancedProgrammingInSwiftFinal
//
//  Created by Glendon Philipp Baculio on 4/26/23.
//

import Foundation
import SwiftUI
import UIKit
import Combine

struct MenuItemDetailsView: View {
    let item: MenuItem
    let cache = ImageCache()
    
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: item.image)!,
                placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .cornerRadius(10)
                },
                imageCache: cache
            )
            .frame(maxWidth: .infinity)
            .aspectRatio(1.0, contentMode: .fit)
            
            Text(item.title)
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 16)
            
            Text(String(item.ordersCount))
                .font(.system(size: 16))
                .padding(.top, 8)
                .padding(.horizontal, 16)
            
            Spacer()
        }
        .navigationBarTitle(Text(item.title), displayMode: .inline)
      
    }
}

 
