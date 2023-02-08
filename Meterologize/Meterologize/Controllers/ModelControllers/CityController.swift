//
//  CityController.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/6/23.
//  Edited by Scott Ayers on 2/8/23.
//

import Foundation

class CityController {

	// MARK: - Properties
	// Shared Instance
	static let sharedInstance = CityController()
	// Source of Truth
	var cities: [City] = []

	// MARK: - CRUD FUNCTIONS
	func createCity(name: String, temp: Double, high: Int? = nil, low: Int? = nil, status: String? = nil) {
		let newCity = City(name: name, currentTemp: temp, dailyHigh: high, dailyLow: low, currentStatus: status)
		cities.append(newCity)
	} //: func CREATE
    
    
    //MARK: - UPDATE
    func updateCity(cityToUpdate: City, newName: String, newTemp: Double) {
        cityToUpdate.name           = newName
        cityToUpdate.currentTemp    = newTemp
    } //: func UPDATE
    
    
    //MARK: - DELETE
    func deleteCity(cityToDelete city: City) {
        guard let cityIndex = cities.firstIndex(of: city) else { return }
        cities.remove(at: cityIndex)
    } //: func DELETE
    
} //: CLASS
