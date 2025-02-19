//
//  ContentView.swift
//  StateVsObservedObject
//
//  Created by Bipul Islam on 19/2/25.
//


// In SwiftUI, @StateObject and @ObservedObject are both used to manage observable
// objects, but they behave differently in terms of lifecycle and ownership

// 1. @StateObject (Recommended for creating ViewModel)
//    * SwiftUI owns and manages the lifecycle of the object
//    * The instance persists even when the view is recreated
//    * Ideal for creating the ViewModel inside a view
//
// 2. @ObservedObject (For injecting existing ViewModel)
//    * The view does not own the object; it depends on an extenal source
//    * When the view is recreated, a new instance is created, resetting state
//    * Ideal for passing an already created object from a parent

import SwiftUI

final class CounterViewModel: ObservableObject {
    
    @Published var count : Int = 0
    
    init(){
        print("Init Called")
    }
    
    func incrementCount(){
        count += 1
    }
}


struct ContentView: View {
    
    //@State private var count : Int = 0
    //@ObservedObject var viewModel = CounterViewModel()
    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            
            Text("Count: \(viewModel.count)")
            
            Button("Increment Count"){
                //count += 1
                viewModel.incrementCount()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct RandomNumberView: View {
    @State var number: Int = 0
    var body: some View {
        
        VStack (spacing: 24){
            Text("Random number: \(number)")
            
            Button("Generate Random Number"){
                number = (0...100).randomElement() ?? 0
            }
            .buttonStyle(.borderedProminent)
            
            ContentView()
        }
    }
}

#Preview {
    RandomNumberView()
}
