//
//  FlightViewModel.swift
//  Aviation Crew
//
//  Created by Marcos Garcia on 03/03/26.
//

import Foundation
import SwiftUI

@Observable
class FlightViewModel {
    
    // Lista de pilotos disponibles
    // Lista de pilotos disponibles para la demo
    var availablePilots: [String] = [
        "Capt. Alejandro Rivera",
        "Capt. Beatriz Morales",
        "Capt. Carlos Mendoza",
        "Capt. Daniela Soto",
        "Capt. Enrique Peña",
        "Capt. Fernanda Luna",
        "Capt. Gerardo Ruiz"
    ]
    
    // Lista de vuelos inicial para la demo
    var flights: [FlightLog] = [
        // Capt. Alejandro Rivera
        FlightLog(flightNumber: "AMX001", pilot: "Capt. Alejandro Rivera", origin: "MEX", destination: "MAD", date: Date().addingTimeInterval(-86400 * 1)),
        FlightLog(flightNumber: "AMX002", pilot: "Capt. Alejandro Rivera", origin: "MAD", destination: "MEX", date: Date().addingTimeInterval(-86400 * 2)),
        FlightLog(flightNumber: "AMX123", pilot: "Capt. Alejandro Rivera", origin: "MEX", destination: "CUN", date: Date().addingTimeInterval(-86400 * 3)),
        FlightLog(flightNumber: "AMX124", pilot: "Capt. Alejandro Rivera", origin: "CUN", destination: "MEX", date: Date().addingTimeInterval(-86400 * 4)),
        FlightLog(flightNumber: "AMX500", pilot: "Capt. Alejandro Rivera", origin: "MEX", destination: "JFK", date: Date().addingTimeInterval(-86400 * 5)),
        
        // Capt. Beatriz Morales
        FlightLog(flightNumber: "VOI101", pilot: "Capt. Beatriz Morales", origin: "MTY", destination: "CUN", date: Date().addingTimeInterval(-3600 * 10)),
        FlightLog(flightNumber: "VOI102", pilot: "Capt. Beatriz Morales", origin: "CUN", destination: "MTY", date: Date().addingTimeInterval(-3600 * 20)),
        FlightLog(flightNumber: "VOI200", pilot: "Capt. Beatriz Morales", origin: "MTY", destination: "GDL", date: Date().addingTimeInterval(-86400 * 1.5)),
        FlightLog(flightNumber: "VOI201", pilot: "Capt. Beatriz Morales", origin: "GDL", destination: "MTY", date: Date().addingTimeInterval(-86400 * 2.5)),
        FlightLog(flightNumber: "VOI300", pilot: "Capt. Beatriz Morales", origin: "MTY", destination: "MEX", date: Date().addingTimeInterval(-86400 * 3.5)),
        
        // Capt. Carlos Mendoza
        FlightLog(flightNumber: "AAL456", pilot: "Capt. Carlos Mendoza", origin: "JFK", destination: "LHR", date: Date().addingTimeInterval(-86400 * 1)),
        FlightLog(flightNumber: "AAL457", pilot: "Capt. Carlos Mendoza", origin: "LHR", destination: "JFK", date: Date().addingTimeInterval(-86400 * 2)),
        FlightLog(flightNumber: "AAL100", pilot: "Capt. Carlos Mendoza", origin: "JFK", destination: "MIA", date: Date().addingTimeInterval(-86400 * 3)),
        FlightLog(flightNumber: "AAL101", pilot: "Capt. Carlos Mendoza", origin: "MIA", destination: "JFK", date: Date().addingTimeInterval(-86400 * 4)),
        FlightLog(flightNumber: "AAL888", pilot: "Capt. Carlos Mendoza", origin: "JFK", destination: "LAX", date: Date().addingTimeInterval(-86400 * 5)),
        
        // Capt. Daniela Soto
        FlightLog(flightNumber: "IBE300", pilot: "Capt. Daniela Soto", origin: "MAD", destination: "PAR", date: Date().addingTimeInterval(-3600 * 5)),
        FlightLog(flightNumber: "IBE301", pilot: "Capt. Daniela Soto", origin: "PAR", destination: "MAD", date: Date().addingTimeInterval(-3600 * 15)),
        FlightLog(flightNumber: "IBE400", pilot: "Capt. Daniela Soto", origin: "MAD", destination: "BCN", date: Date().addingTimeInterval(-86400 * 1)),
        FlightLog(flightNumber: "IBE401", pilot: "Capt. Daniela Soto", origin: "BCN", destination: "MAD", date: Date().addingTimeInterval(-86400 * 2)),
        FlightLog(flightNumber: "IBE500", pilot: "Capt. Daniela Soto", origin: "MAD", destination: "FRA", date: Date().addingTimeInterval(-86400 * 3)),
        
        // Capt. Enrique Peña
        FlightLog(flightNumber: "CMP111", pilot: "Capt. Enrique Peña", origin: "PTY", destination: "MEX", date: Date().addingTimeInterval(-86400 * 1)),
        FlightLog(flightNumber: "CMP112", pilot: "Capt. Enrique Peña", origin: "MEX", destination: "PTY", date: Date().addingTimeInterval(-86400 * 2)),
        FlightLog(flightNumber: "CMP200", pilot: "Capt. Enrique Peña", origin: "PTY", destination: "BOG", date: Date().addingTimeInterval(-86400 * 3)),
        FlightLog(flightNumber: "CMP201", pilot: "Capt. Enrique Peña", origin: "BOG", destination: "PTY", date: Date().addingTimeInterval(-86400 * 4)),
        FlightLog(flightNumber: "CMP300", pilot: "Capt. Enrique Peña", origin: "PTY", destination: "VVI", date: Date().addingTimeInterval(-86400 * 5)),
        
        // Capt. Fernanda Luna
        FlightLog(flightNumber: "GLO700", pilot: "Capt. Fernanda Luna", origin: "GRU", destination: "EZE", date: Date().addingTimeInterval(-3600 * 8)),
        FlightLog(flightNumber: "GLO701", pilot: "Capt. Fernanda Luna", origin: "EZE", destination: "GRU", date: Date().addingTimeInterval(-3600 * 18)),
        FlightLog(flightNumber: "GLO800", pilot: "Capt. Fernanda Luna", origin: "GRU", destination: "GIG", date: Date().addingTimeInterval(-86400 * 1.2)),
        FlightLog(flightNumber: "GLO801", pilot: "Capt. Fernanda Luna", origin: "GIG", destination: "GRU", date: Date().addingTimeInterval(-86400 * 2.2)),
        FlightLog(flightNumber: "GLO900", pilot: "Capt. Fernanda Luna", origin: "GRU", destination: "SCL", date: Date().addingTimeInterval(-86400 * 3.2)),
        
        // Capt. Gerardo Ruiz
        FlightLog(flightNumber: "TRA555", pilot: "Capt. Gerardo Ruiz", origin: "MEX", destination: "TIJ", date: Date().addingTimeInterval(-86400 * 1)),
        FlightLog(flightNumber: "TRA556", pilot: "Capt. Gerardo Ruiz", origin: "TIJ", destination: "MEX", date: Date().addingTimeInterval(-86400 * 2)),
        FlightLog(flightNumber: "TRA600", pilot: "Capt. Gerardo Ruiz", origin: "MEX", destination: "OAX", date: Date().addingTimeInterval(-86400 * 3)),
        FlightLog(flightNumber: "TRA601", pilot: "Capt. Gerardo Ruiz", origin: "OAX", destination: "MEX", date: Date().addingTimeInterval(-86400 * 4)),
        FlightLog(flightNumber: "TRA700", pilot: "Capt. Gerardo Ruiz", origin: "MEX", destination: "MID", date: Date().addingTimeInterval(-86400 * 5)),
    ]
    
    // Nombre del archivo donde guardaremos todo en formato JSON
    private let saveKey = "aviation_crew_flights.json"
    
    // Todo: ruta a los Documentos del dispositivo
    private var savePath: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0].appendingPathComponent(saveKey)
    }
    
    // Init se ejecuta cuando creamos el ViewModel por primera vez
    init() {
        loadData()
    }
    
    // MARK: - Intentions (Acciones)
    
    func addFlight(flight: FlightLog) {
        flights.append(flight)
        saveData()
    }
    
    // MARK: - Persistence (Guardado JSON)
    
    func loadData() {
        do {
            // 1. Intentamos leer el archivo en 'savePath'
            let data = try Data(contentsOf: savePath)
            
            // 2. Decodificamos la Data -> JSON -> [FlightLog]
            let decodedFlights = try JSONDecoder().decode([FlightLog].self, from: data)
            
            // 3. Asignamos lo que leímos a nuestra variable
            flights = decodedFlights
        } catch {
            print("No se pudieron cargar los datos o es la primera vez que se abre la app. Se usarán los datos de demo.")
            // No vaciamos 'flights' para que se queden los datos de demo iniciales
            // Opcionalmente guardamos los de demo para que ya existan en el archivo
            saveData()
        }
    }
    
    func saveData() {
        do {
            // 1. Convertimos nuestro arreglo [FlightLog] -> Data (formato JSON)
            let data = try JSONEncoder().encode(flights)
            
            // 2. Escribimos esa Data atómica (de golpe) en el disco
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            print("Datos guardados exitosamente en \(savePath.absoluteString)")
        } catch {
            print("Error al guardar datos: \(error.localizedDescription)")
        }
    }
    // MARK: - Borrar
    func deleteFlight(at offsets: IndexSet) {
        flights.remove(atOffsets: offsets)
        saveData() // Importante guardar después de borrar
    }
    
    // borrar pasando el vuelo exacto (para nuestra lista filtrada)
    func deleteFlight(_ flight: FlightLog) {
        if let index = flights.firstIndex(where: { $0.id == flight.id }) {
            flights.remove(at: index)
            saveData()
        }
    }
    // MARK: - Editar
    func updateFlight(_ updatedFlight: FlightLog) {
        if let index = flights.firstIndex(where: { $0.id == updatedFlight.id }) {
            flights[index] = updatedFlight
            saveData()
        }
    }


}
