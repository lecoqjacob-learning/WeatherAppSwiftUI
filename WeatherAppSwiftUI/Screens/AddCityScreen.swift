//
//  AddCityScreen.swift
//  WeatherAppSwiftUI
//
//  Created by Mohammad Azam on 3/5/21.
//

import SwiftUI

struct AddCityScreen: View {
    @EnvironmentObject var store: Store
    @Environment(\.presentationMode) private var presentationMode

    @ObservedObject private var addWeatherVM = AddWeatherViewModel()
    @State private var isShowingAlert: Bool = false
    @State private var isSaving: Bool = false

    private var isDisabled: Bool {
        return isSaving || self.addWeatherVM.city.isEmpty
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                TextField("Enter city", text: $addWeatherVM.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    self.isSaving.toggle()

                    addWeatherVM.save { weather, _ in
                        if let weather = weather {
                            presentationMode.wrappedValue.dismiss()
                            store.addWeather(weather)
                        } else {
                            self.isShowingAlert.toggle()
                        }
                    }
                }) {
                    if !isSaving {
                        Text("Save")
                    } else {
                        ProgressView()
                            .shadow(color: Color(red: 1, green: 0, blue: 0.0), radius: 4.0, x: 1.0, y: 2.0)
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.yellow))
                    }
                }
                .disabled(self.isDisabled)
                .padding(10)
                .frame(maxWidth: UIScreen.main.bounds.width / 4)
                .foregroundColor(Color.white)
                .background(isDisabled ? Color.gray : Color(#colorLiteral(red: 0.1297150552, green: 0.3200980425, blue: 0.8191890121, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(Color(#colorLiteral(red: 0.913837254, green: 0.9333122373, blue: 0.9802277684, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))

            Spacer()
        }
        .alert(isPresented: self.$isShowingAlert) {
            Alert(title: Text("City Not Found"))
        }
        .padding()

        .navigationTitle("Add City")
        .embedInNavigationView()
    }
}

struct AddCityScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddCityScreen().environmentObject(Store())
    }
}

struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}
