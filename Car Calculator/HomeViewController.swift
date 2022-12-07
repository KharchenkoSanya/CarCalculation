//
//  ViewController.swift
//  Car Calculator
//
//  Created by Sashka IOS Developer on 06.12.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var carTypeSegmentControl: UISegmentedControl!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTypeTextField: UITextField!
    @IBOutlet weak var productionYearTextField: UITextField!
    @IBOutlet weak var fuelTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    let pickerView = UIPickerView()
    
    let titleType = ["Sedan", "Coupe", "Station wagon", "Minivan"]
    let titleBrand = ["Audi", "BMW", "Mazda", "Mercedes-Benz", "Volkswagen"]
    let titleModelType = ["SyperCar"]
    let titleProductionYear = [2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022]
    let titleFuel = ["Petrol", "Diesel", "Gas", "Electro",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCarTypeSegmentControl()
        configyreTextField()
        configureDrumTextField()
    }
    
    
    @IBAction func calculateDidTap(_ sender: Any) {}
    
    
    @IBAction func clearDidTap(_ sender: Any) {}
    
    func configureCarTypeSegmentControl() {
        carTypeSegmentControl.removeAllSegments()
        carTypeSegmentControl.insertSegment(withTitle: "Ukrain", at: 0, animated: false)
        carTypeSegmentControl.insertSegment(withTitle: "USA", at: 1, animated: false)
        carTypeSegmentControl.selectedSegmentIndex = 0
    }
        func configyreTextField() {
            priceTextField.delegate = self
            priceTextField.keyboardType = .numberPad
        
    }
    func configureDrumTextField() {
        pickerView.dataSource = self
        pickerView.delegate = self
        typeTextField.inputView = pickerView
        brandTextField.inputView = pickerView
        modelTypeTextField.inputView = pickerView
        productionYearTextField.inputView = pickerView
        fuelTextField.inputView = pickerView
        selectTitleBy(row: 0)
    }
    func selectTitleBy(row: Int) {
        typeTextField.text = titleType[row]
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
extension HomeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == typeTextField {
            typeTextField.self = titleType
            titleType.count
        } else if pickerView == brandTextField {
            //logic for brandTextField
            titleBrand.count
        } else if pickerView == modelTypeTextField {
            //logic for modelTypeTextField
            titleModelType.count
        } else if pickerView == productionYearTextField {
            //logic for productionYearTextField
            titleProductionYear.count
        } else if pickerView == fuelTextField {
            //logic for fuelTextField
            titleFuel.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == typeTextField {
            pickerView.self = 
            titleType.[row].title
        } else if pickerView == brandTextField {
            pickerView.self =
            titleBrand.[row].title
        } else if pickerView == modelTypeTextField {
            //logic for modelTypeTextField
            titleModelType.[row].title
        } else if pickerView == productionYearTextField {
            //logic for productionYearTextField
            titleProductionYear.[row].title
        } else if pickerView == fuelTextField {
            //logic for fuelTextField
            titleFuel.[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectTitleBy(row: row)
    }
    
}
