//
//  MenuItem.swift
//  AdvancedProgrammingInSwiftFinal
//
//  Created by Glendon Philipp Baculio on 4/26/23.
//

import Foundation

class MenuItem: MenuItemProtocol {
    let id: UUID
    let title: String
    let image: String
    let menuCategory: MenuCategory
    var ordersCount: Int
    var price: Double
    var ingredients: [Ingredient]
    
    init(
        title: String,
        image: String,
        menuCategory: MenuCategory,
        ordersCount: Int = 0,
        price: Double,
        ingredients: [Ingredient]
    ) {
        self.id = UUID()
        self.title = title
        self.image = image
        self.menuCategory = menuCategory
        self.ordersCount = ordersCount
        self.price = price
        self.ingredients = ingredients
    }
}

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var image: String { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var ingredients: [Ingredient] { get set }
}

class MenuViewViewModel: ObservableObject {
    @Published var foodItems: [MenuItem] = []
    @Published var drinkItems: [MenuItem] = []
    @Published var dessertItems: [MenuItem] = []
    
    init() {
        // Initialize menu items
        foodItems = [
            MenuItem(title: "Cheeseburger", image: "https://www.themealdb.com/images/media/meals/3xn7th1560453426.jpg", menuCategory: .food, ordersCount: 50, price: 8.99, ingredients: [.spinach, .broccoli]),
            MenuItem(title: "Margherita Pizza", image: "https://www.themealdb.com/images/media/meals/58oia61582372102.jpg", menuCategory: .food, ordersCount: 30, price: 10.99, ingredients: [.broccoli, .carrot]),
            MenuItem(title: "Grilled Chicken Tacos", image: "https://www.themealdb.com/images/media/meals/9utbty1615875013.jpg", menuCategory: .food, ordersCount: 80, price: 9.99, ingredients: [.spinach, .carrot]),
            MenuItem(title: "Salmon Sushi", image: "https://www.themealdb.com/images/media/meals/usuqtp1511177513.jpg", menuCategory: .food, ordersCount: 20, price: 14.99, ingredients: [.spinach, .pasta]),
            MenuItem(title: "Spaghetti Carbonara", image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg", menuCategory: .food, ordersCount: 10, price: 12.99, ingredients: [.pasta, .tomatoSauce]),
            MenuItem(title: "Caesar Salad", image: "https://www.themealdb.com/images/media/meals/wyxwsp1486979827.jpg", menuCategory: .food, ordersCount: 60, price: 7.99, ingredients: [.spinach, .carrot]),
            MenuItem(title: "Beef Stroganoff", image: "https://www.themealdb.com/images/media/meals/svprys1511176755.jpg", menuCategory: .food, ordersCount: 75, price: 13.99, ingredients: [.broccoli, .pasta]),
            MenuItem(title: "Eggplant Parmesan", image: "https://www.themealdb.com/images/media/meals/vvusxs1468256321.jpg", menuCategory: .food, ordersCount: 40, price: 10.99, ingredients: [.carrot, .tomatoSauce]),
            MenuItem(title: "Chicken Alfredo", image: "https://www.themealdb.com/images/media/meals/uquqtu1511178042.jpg", menuCategory: .food, ordersCount: 90, price: 11.99, ingredients: [.broccoli, .spinach]),
            MenuItem(title: "Meatball Sub", image: "https://www.themealdb.com/images/media/meals/tvtxpq1511464705.jpg", menuCategory: .food, ordersCount: 25, price: 9.99, ingredients: [.broccoli, .tomatoSauce]),
            MenuItem(title: "Beef Chili", image: "https://www.themealdb.com/images/media/meals/uuuspp1511297945.jpg", menuCategory: .food, ordersCount: 70, price: 8.99, ingredients: [.spinach, .tomatoSauce]),
            MenuItem(title: "Chicken Quesadilla",image: "https://www.themealdb.com/images/media/meals/btyqup1511815393.jpg",  menuCategory: .food, ordersCount: 45, price: 10.99, ingredients: [.carrot, .pasta])
        ]
        
        drinkItems = [
            MenuItem(title: "Iced Coffee", image: "https://www.themealdb.com/images/media/meals/yt8ysv1619703430.jpg", menuCategory: .drink, ordersCount: 12, price: 3.99, ingredients: [.coffee, .milk]),
            MenuItem(title: "Green Tea", image: "https://www.themealdb.com/images/media/meals/rysb3r1511797945.jpg", menuCategory: .drink, ordersCount: 33, price: 2.99, ingredients: [.greenTea]),
            MenuItem(title: "Hot Chocolate", image: "https://www.themealdb.com/images/media/meals/qxutws1486979976.jpg", menuCategory: .drink, ordersCount: 7, price: 4.99, ingredients: [.cocoa, .milk]),
            MenuItem(title: "Mango Lassi", image: "https://www.themealdb.com/images/media/meals/crpw601619670480.jpg", menuCategory: .drink, ordersCount: 13, price: 3.99, ingredients: [.mango, .yogurt]),
            MenuItem(title: "Pina Colada", image: "https://www.themealdb.com/images/media/meals/qrqywr1503066605.jpg", menuCategory: .drink, ordersCount: 14, price: 5.99, ingredients: [.pineapple, .coconutMilk]),
            MenuItem(title: "Lemonade", image: "https://www.themealdb.com/images/media/meals/tquyyt1487488868.jpg", menuCategory: .drink, ordersCount: 14, price: 2.99, ingredients: [.lemon, .sugar]),
            MenuItem(title: "Mojito", image: "https://www.themealdb.com/images/media/meals/rxtqps1468339442.jpg", menuCategory: .drink, ordersCount: 66, price: 6.99, ingredients: [.lime, .mint, .sugar, .rum]),
            MenuItem(title: "Orange Juice", image: "https://www.themealdb.com/images/media/meals/uttuxy1487327564.jpg", menuCategory: .drink, ordersCount: 44, price: 2.99, ingredients: [.orange])
        ]
        dessertItems = [
            MenuItem(title: "Chocolate Cake", image: "https://www.themealdb.com/images/media/meals/ssrrrs1503664277.jpg",menuCategory: .dessert,ordersCount: 22, price: 5.99, ingredients: [.chocolate, .flour]),
            MenuItem(title: "Apple Pie", image: "https://www.themealdb.com/images/media/meals/xqqqtu1468232682.jpg",menuCategory: .dessert, ordersCount: 33, price: 4.99,ingredients: [.apple, .flour]),
            MenuItem(title: "Tiramisu", image: "https://www.themealdb.com/images/media/meals/xrqqtu1468232227.jpg",menuCategory: .dessert, ordersCount: 44, price: 6.99,ingredients: [.coffee, .flour]),
            MenuItem(title: "Ice Cream Sundae", image: "https://www.themealdb.com/images/media/meals/wurrux1468416624.jpg", menuCategory: .dessert, ordersCount: 55, price: 3.99,ingredients: [.vanillaIceCream, .chocolateSyrup])
        ]
    }
}
