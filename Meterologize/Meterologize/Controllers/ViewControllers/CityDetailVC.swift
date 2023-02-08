//
//  CityDetailVC.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/6/23.
//  Edited by Scott Ayers on 2/8/23.
//

import UIKit

class CityDetailVC: UIViewController {

	// MARK: - OUTLETS
	@IBOutlet weak var cityNameLabel: UILabel!
	@IBOutlet weak var currentStatusLabel: UILabel!
	@IBOutlet weak var currentTempLabel: UILabel!
	@IBOutlet weak var projectedHighLabel: UILabel!
	@IBOutlet weak var projectedLowLabel: UILabel!

    
    //MARK: - PROPERTIES
    var objectToReceiveData: City?
    
    
	// MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

		updateViews()
    } //: LIFECYCLE

	// MARK: - METHODS
	func updateViews() {
        guard let city = objectToReceiveData else { return }

		cityNameLabel.text          = city.name
		currentStatusLabel.text     = city.currentStatus
		currentTempLabel.text       = "Current Temp: \(city.currentTemp)°F"
		projectedHighLabel.text     = "High: \(city.dailyHigh)°F"
		projectedLowLabel.text      = "Low: \(city.dailyLow)°F"

		self.view.backgroundColor = city.currentTemp <= 80.0 ? .systemPurple : .systemRed
	} //: FUNC
    
} //: CLASS
