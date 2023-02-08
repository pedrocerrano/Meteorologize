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
    @IBOutlet weak var cityNameTextField: UITextField!
	@IBOutlet weak var currentStatusLabel: UILabel!
    @IBOutlet weak var cityTempTextField: UITextField!
	@IBOutlet weak var projectedHighLabel: UILabel!
	@IBOutlet weak var projectedLowLabel: UILabel!

    
    //MARK: - PROPERTIES
    var objectToReceiveData: City?
    
    
	// MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

		updateViews()
    } //: LIFECYCLE

    
    //MARK: - ACTIONS
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    } //: SAVE BUTTON
    
    
	// MARK: - METHODS
	func updateViews() {
        guard let city = objectToReceiveData else { return }

        cityNameTextField.text          = city.name
		currentStatusLabel.text     = city.currentStatus
		cityTempTextField.text       = "\(city.currentTemp)°F"
        projectedHighLabel.text     = "High: \(city.dailyHigh ?? 0)°F"
		projectedLowLabel.text      = "Low: \(city.dailyLow ?? 0)°F"

		self.view.backgroundColor = city.currentTemp <= 80.0 ? .systemPurple : .systemRed
	} //: func UPDATE
    
} //: CLASS
