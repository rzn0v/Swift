//
//  ContentView.swift
//  Shared
//
//  Created by user on 13/09/23.
//

import SwiftUI

struct Product : Identifiable{
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
}

let sampleProducts = [
    Product(name: "Macbook M2",price:900.00,imageName: "Macbook"),
    Product(name: "Iphone 14 Pro",price: 999.00,imageName: "Iphone14pro"),
    Product(name: "Watch 8", price: 299.00, imageName: "watch8"),
    Product(name: "ipad pro", price: 899.00, imageName: "ipadpro"),
    Product(name: "Airpods max", price: 799.00, imageName: "Airpodsmax")
]
struct ProductTiles: View{
    let product: Product
    var body: some View {
        VStack(alignment: .leading,spacing: 8){
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 150)
            Text(product.name)
                .font(.headline)
            Text("$\(String(format: "%.2f",product.price))")
                .font(.subheadline)
                .foregroundColor(.secondary)

        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}
struct ContentView : View {
    let columns:[GridItem] = [
        GridItem(.flexible(minimum:100, maximum: 200),spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 200),spacing:16)
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(sampleProducts)
                    { product in
                        NavigationLink(destination: Productdetail(product: product)){
                        ProductTiles(product: product)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("E-commerce Store App")
    }
}
struct Productdetail : View{
    let product: Product
    var body: some View{
        VStack{
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            Text(product.name)
                .font(.title)
                .padding()
        Text("Price:$\(String(format: "%.2f",product.price))")
            .font(.headline)
            .padding()
        Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
