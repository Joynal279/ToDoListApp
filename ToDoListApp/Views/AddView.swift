//
//  AddView.swift
//  ToDoListApp
//
//  Created by JOYNAL ABEDIN on 25/10/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.white)
                    .cornerRadius(10)
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
            
        }
        .navigationTitle("Add your notes")
        .alert(isPresented: $showAlet, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters"
            showAlet.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
