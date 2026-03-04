//
//  AddFlightView.swift
//  Aviation Crew
//
//  Created by Marcos Garcia on 03/03/26.
//

import SwiftUI

struct AddFlightView: SwiftUI.View {
    @Environment(\.dismiss) var dismiss
    // Recibe el control central
      var viewModel: FlightViewModel
    
    //Estados temporales del formulario
    @State private var flightNumber: String = ""
    @State private var pilot: String = ""
    @State private var origin: String = ""
    @State private var destination: String = ""
    @State private var flightDate: Date = Date()
    
    var flightToEdit: FlightLog?
    
    var body: some SwiftUI.View {
        NavigationStack {
            Form {
                Section(header: Text("Flight Details")) {
                    TextField("Flight Number", text: $flightNumber)
                        .disableAutocorrection(true)
                        .onChange(of: flightNumber) { oldValue, newValue in
                            let upper = newValue.uppercased()
                            if upper != newValue { flightNumber = upper }
                        }
                    Picker("Selecciona el Piloto", selection: $pilot) {
                        // Opción vacía por defecto
                        Text("Ninguno").tag("")
                        
                        // Recorremos los pilotos del ViewModel
                        ForEach(viewModel.availablePilots, id: \.self) { pilotName in
                            Text(pilotName).tag(pilotName)
                        }
                    }
                    // Opcional: le da un estilo de menú o rueda
                    .pickerStyle(.menu)

                }

                Section(header: Text("Ruta")) {
                    TextField("Origen (ej. MEX)", text: $origin)
                        .onChange(of: origin) { oldValue, newValue in
                            let upper = newValue.uppercased()
                            if upper != newValue { origin = upper }
                        }

                    TextField("Destino (ej. JFK)", text: $destination)
                        .onChange(of: destination) { oldValue, newValue in
                            let upper = newValue.uppercased()
                            if upper != newValue { destination = upper }
                        }
                }

                Section(header: Text("Itinerario")) {
                    DatePicker("Fecha de salida", selection: $flightDate, displayedComponents: [.date, .hourAndMinute])
                }
            }
            .onAppear {
                if let flight = flightToEdit {
                    // Si hay vuelo, llenar los textfields con sus datos
                    flightNumber = flight.flightNumber
                    pilot = flight.pilot
                    origin = flight.origin
                    destination = flight.destination
                    flightDate = flight.date
                }
            }

            .navigationTitle(flightToEdit == nil ? "Nuevo vuelo" : "Editar vuelo")
#if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
#endif
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Guardar"){
                        if let flight = flightToEdit {
                            // Modo Edición
                            // 1. Crear un vuelo "actualizado" conservando el MISMO ID
                            let updatedFlight = FlightLog(id: flight.id,
                                                          flightNumber: flightNumber,
                                                          pilot: pilot,
                                                          origin: origin,
                                                          destination: destination,
                                                          date: flightDate)
                            viewModel.updateFlight(updatedFlight)
                        } else {
                            // Modo Creación
                            let newFlight = FlightLog(flightNumber: flightNumber,
                                                      pilot: pilot,
                                                      origin: origin,
                                                      destination: destination,
                                                      date: flightDate)
                            viewModel.addFlight(flight: newFlight)
                        }
                        dismiss()
                    }
                    //deshabilitar boton si no hay datos
                    .disabled(flightNumber.isEmpty || pilot.isEmpty || origin.isEmpty || destination.isEmpty )
                }
            }
        }
    }
}
#Preview {
    AddFlightView(viewModel: FlightViewModel())
}

