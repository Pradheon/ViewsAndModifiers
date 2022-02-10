//
//  ContentView.swift
//  JoshanRai-ViewsAndModifiers
//
//  Created by Joshan Rai on 2/9/22.
//

import SwiftUI

//   View composition
/*
struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            //.foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}
 */

//   Custom Modifiers
/*
struct Watermark: ViewModifier  {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}
*/

/*
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
*/

//   Custom Containers
/*
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}
*/

//   Views and modifiers: Wrap up
struct LargeBlueFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeBlueFontStyle() -> some View {
        modifier(LargeBlueFont())
    }
}


struct ContentView: View {
    //   Conditional modifiers
    //@State private var useRedText = false
    
    //   Views as properties
    //let motto1 = Text("Draco dormiens")
    /*
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titillandus")
    
    @ViewBuilder var spells: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
     */
    
    var body: some View {
        //   What is behind the main SwiftUI view?
        /*
        Text("Hello, world!")
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
         */
        
        //  Why does SwiftUI use “some View” for its view type?
        /*
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(.red)
         */
        
        //   Why modifier order matters
        /*
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
         */
        
        //   Conditional modifiers
        /*
        Button("Hello World") {
            // flip the boolean between true and false
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
         */
        // Below code does the same as the above with ternary operator but the below code is less efficient.
        /*
        if useRedText {
            Button("Hello World") {
                useRedText.toggle()
            }
            .foregroundColor(.red)
        } else {
            Button("Hello World") {
                useRedText.toggle()
            }
            .foregroundColor(.blue)
        }
         */
        
        //   Environment modifiers
        /*
        VStack {
            Text("Gryffindor")
                //.font(.largeTitle)
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        //.font(.title)
        .blur(radius: 5)
         */
        
        //   Views as properties
        /*
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }
        HStack {
            spells
        }
        spells
         */
        
        //   View composition
        /*
        VStack(spacing: 10) {
            /*
            Text("First")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
            
            Text("Second")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
             */
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
        }
         */
        
        //   Custom Modifiers
        /*
        Text("Hello, world!")
            //.modifier(Title())
            .titleStyle()
         */
        /*
        Color.blue.frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
         */
        
        //   Custom Containers
        /*
        GridStack(rows: 4, columns: 4) { row, col in
            //VStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            //}
        }
         */
        
        //   Views and modifiers: Wrap up
        Text("Hello, SwiftUI!")
            .largeBlueFontStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
