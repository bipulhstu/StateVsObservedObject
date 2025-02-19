//
//  MainView.swift
//  StateVsObservedObject
//
//  Created by Bipul Islam on 19/2/25.
//

//MainView (Creates ViewModel) - @StateObject - Ensures the instances persists.
//CounterView (Uses ViewModel) - @ObservedObject - Observes changes, doesn't reset
//IncrementView (Uses ViewModel) - @ObservedObject - Observes the same shared instances.

import SwiftUI


final class CounterViewModel2: ObservableObject {
    
    @Published var count : Int = 0
    
    func incrementCount(){
        count += 1
    }
    
    func reset(){
        count = 0
    }
}


struct MainView: View {
    
    @StateObject var vm = CounterViewModel2()
    
    var body: some View {
        VStack (spacing: 24){
            Text("Main View Counter: \(vm.count)")
                .font(.title)
            
            CounterView(vm: vm)
            
            IncrementView(vm: vm)
            
            Button("Reset"){
                vm.reset()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct CounterView: View {
    
    @ObservedObject var vm: CounterViewModel2
    
    var body: some View {
        VStack{
            Text("Counter View Counter: \(vm.count)")
                .font(.headline)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
        }
    }
}

struct IncrementView: View {
    
    @ObservedObject var vm: CounterViewModel2
    
    var body: some View {
        VStack{
            Button("Increment Counter"){
                vm.incrementCount()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    MainView()
}
