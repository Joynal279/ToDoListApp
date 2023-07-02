//
//  ListView.swift
//  ToDoListApp
//
//  Created by JOYNAL ABEDIN on 25/10/22.
//

import SwiftUI
import LocalAuthentication

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var isUnlocked = false
    
    var body: some View {
        List {
            VStack {
                if isUnlocked{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    if isUnlocked {
                                        listViewModel.updateItem(item: item)
                                    }else{
                                        authenticateLockScreen()
                                    }
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }else{
                    Button {
                        authenticateLockScreen()
                    } label: {
                        Text("Unlock Screen")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }

                }
            }
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Notes List")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink(
                    "Add", destination: AddView())
        )
        //.onAppear(perform: authenticate)
    }
    
    func authenticateLockScreen() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    isUnlocked = true
                    print("unlock hoiche...")
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


