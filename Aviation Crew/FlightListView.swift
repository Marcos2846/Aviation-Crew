//
//  ContentView.swift
//  Aviation Crew
//
//  Created by Marcos Garcia on 03/03/26.
//

import SwiftUI
struct ContentView: SwiftUI.View{
    //variable temporal para mostrar/ocultar hoja de registro
    @State private var showingAddFlight = false
    @State private var viewModel = FlightViewModel()
    @State private var selectedPilot: String? = "Todos los Pilotos"
    @State private var flightToEdit: FlightLog?

    
    var uniquePilots: [String] {
        Array(Set(viewModel.flights.map { $0.pilot })).sorted()
    }
    
    var filteredFlights: [FlightLog] {
        if let pilot = selectedPilot, pilot != "Todos los Pilotos" {
            return viewModel.flights.filter { $0.pilot == pilot }
        } else {
            return viewModel.flights
        }
    }
    
    var body: some SwiftUI.View{
        NavigationSplitView {
            VStack {
                //Header: total de vuelos
                HStack{
                    VStack (alignment: .leading){
                        Text("Total Registrados")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text("\(viewModel.flights.count)")
                            .font(.system(.title, design: .rounded, weight: .bold))
                            .foregroundStyle(.blue)
                        
                    }
                    Spacer()
                }
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
                
                List(selection: $selectedPilot) {
                    Text("Todos los Pilotos")
                        .tag("Todos los Pilotos" as String?)
                    
                    ForEach(uniquePilots, id: \.self) { pilot in
                        Text(pilot)
                            .tag(pilot as String?)
                    }
                }
            }
            .navigationTitle("Pilotos")
        } detail: {
            NavigationStack {
                List{
                    ForEach(filteredFlights) { flight in
                        Button {
                            // Al tocar la fila, guardamos el vuelo en la variable y activamos la "sheet"
                            flightToEdit = flight
                            // Para mostrar la hoja usamos tu misma variable
                            showingAddFlight = true
                        } label: {
                            FlightRowView(flight: flight)
                        }
                        .buttonStyle(.plain) // Para que no parezcan botones azules
                    }
                    .onDelete { indexSet in
                        // indexSet nos da la fila exacta que el usuario deslizó
                        // Como estamos usando filteredFlights, obtenemos el vuelo real primero y luego lo borramos por ID:
                        for index in indexSet {
                            let flightToDelete = filteredFlights[index]
                            viewModel.deleteFlight(flightToDelete)
                        }
                    }
                }
#if os(iOS)
                .listStyle(.insetGrouped)
#else
                .listStyle(.inset)
#endif
                .navigationTitle(Text(selectedPilot == "Todos los Pilotos" || selectedPilot == nil ? "Aviation Crew" : selectedPilot!))
                .toolbar{
                    ToolbarItem(placement: .primaryAction){
                        Button {
                            showingAddFlight = true
                        }label:{
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddFlight, onDismiss: {
                    // Limpiamos la selección cuando se cierra la ventana
                    flightToEdit = nil
                }){
                    AddFlightView(viewModel: viewModel, flightToEdit: flightToEdit)
                }
            }
        }
    }
    //Extraemos la celda a su propia vista para mantener ContentView limpio
    struct FlightRowView: SwiftUI.View {
        let flight: FlightLog
        var body : some SwiftUI.View {
            VStack(alignment: .leading, spacing: 5){
                HStack{
                    Text(flight.flightNumber)
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    Text (flight.date, style: .date)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                HStack{
                    Image(systemName: "airplane.departure")
                        .foregroundStyle(.gray)
                    Text(flight.routeString)
                        .font(.subheadline)
                }
                
            }
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    ContentView()
}
