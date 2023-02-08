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
        
        customizeTextAndColors()
		updateViews()
    } //: LIFECYCLE

    
    //MARK: - ACTIONS
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let city = objectToReceiveData,
              let newName = cityNameTextField.text, !newName.isEmpty,
              let newTemp = cityTempTextField.text, !newTemp.isEmpty else { return }
        
        CityController.sharedInstance.updateCity(cityToUpdate: city, newName: newName, newTemp: Double(newTemp) ?? 0)
        
        navigationController?.popViewController(animated: true)
    } //: SAVE BUTTON
    
    
	// MARK: - METHODS
	func updateViews() {
        guard let city = objectToReceiveData else { return }

        cityNameTextField.text      = city.name
		currentStatusLabel.text     = city.currentStatus
		cityTempTextField.text      = "\(city.currentTemp)°F"
        projectedHighLabel.text     = "High: \(city.dailyHigh ?? 0)°F"
		projectedLowLabel.text      = "Low: \(city.dailyLow ?? 0)°F"

		self.view.backgroundColor = city.currentTemp <= 80.0 ? .systemPurple : .systemRed
	} //: func UPDATE
    
    
    func customizeTextAndColors() {
        cityNameTextField.font                          = UIFont.systemFont(ofSize: 40)
        cityNameTextField.attributedPlaceholder         = NSAttributedString(string: "Enter City Name", attributes: [.font: UIFont.boldSystemFont(ofSize: 17)])
        currentStatusLabel.textColor                    = .white
        cityTempTextField.font                          = UIFont.systemFont(ofSize: 40)
        cityTempTextField.attributedPlaceholder         = NSAttributedString(string: "Enter New Temp", attributes: [.font: UIFont.boldSystemFont(ofSize: 17)])
        projectedHighLabel.textColor                    = .white
        projectedLowLabel.textColor                     = .white
        navigationController?.navigationBar.tintColor   = .white
    } //: func TEXT and COLORS
    
} //: CLASS
