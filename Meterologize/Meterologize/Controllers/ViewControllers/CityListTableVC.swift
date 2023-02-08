//
//  CityListTableVC.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/7/23.
//  Edited by Scott Ayers on 2/8/23.
//

import UIKit

class CityListTableVC: UITableViewController {

	// MARK: - OUTLETS
	@IBOutlet weak var cityNameTextField: UITextField!
	@IBOutlet weak var cityTempTextField: UITextField!

    
	// MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    } //: DidLoad
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    } //: WillAppear

    
	// MARK: - ACTIONS
	@IBAction func addCityButtonTapped(_ sender: Any) {
		guard let cityName = cityNameTextField.text, !cityName.isEmpty,
			  let cityTemp = cityTempTextField.text, !cityTemp.isEmpty else { return }

		CityController.sharedInstance.createCity(name: cityName, temp: Double(cityTemp) ?? 0)
		updateTableView()
	} //: + BUTTON

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return CityController.sharedInstance.cities.count
	} //: #ROWS

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                    = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
		cell.selectionStyle         = .none

		let cityForIndex            = CityController.sharedInstance.cities[indexPath.row]

		var config                  = cell.defaultContentConfiguration()
		config.text                 = cityForIndex.name
		config.secondaryText        = "\(cityForIndex.currentTemp)°F"
		cell.contentConfiguration   = config

        return cell
    } //: CELL CONFIG

    
	// MARK: - HELPER
	func updateTableView() {
		self.tableView.reloadData()
	} //: HELPER
    
    
    //MARK: - SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCityDetailVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let destVC = segue.destination as? CityDetailVC {
                    let city = CityController.sharedInstance.cities[indexPath.row]
                    destVC.objectToReceiveData = city
                } //: DESTINATION
            } //: INDEXPATH
        } //: IDENTIFIER
    } //: FUNC
    
} //: CLASS
