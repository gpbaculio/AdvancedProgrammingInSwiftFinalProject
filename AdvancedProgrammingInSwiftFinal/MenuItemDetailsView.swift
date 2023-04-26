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
            .frame(maxWidth: .infinity)
            .aspectRatio(1.0, contentMode: .fit)
         
            Text(item.title)
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 16)
                .foregroundColor(mainColor)
            
            
            Text("Price")
                .font(.system(size: 18, weight: .semibold))
                .padding(.top, 16)
                .foregroundColor(mainColor)
            Text("$\(String(item.price))")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(mainColor)
            
            Text("Ordered")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(mainColor)
                .padding(.top, 16)
            Text(String(item.ordersCount))
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(mainColor)
            
            Text("Ingredients")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(mainColor)
                .padding(.top, 16)
            ForEach(item.ingredients, id: \.self) { ingredient in
                Text(ingredient.rawValue)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(mainColor)
            }
               

            Spacer()
        }
        .navigationBarTitle(Text(item.title), displayMode: .inline)
        .padding()
    }
}

 


 
