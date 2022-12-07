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
    let titleProductionYear = ["2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"]
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
        selectTitleByTypeTextField(row: 0)
    }
    
    func selectTitleByTypeTextField(row: Int) {
        typeTextField.text = titleType[row]
    }
    func selectTitleByBrandTextField(row: Int) {
        brandTextField.text = titleType[row]
    }
    func selectTitleByModelTypeTextField(row: Int) {
        modelTypeTextField.text = titleType[row]
    }
    func selectTitleByProductionYearTextField(row: Int) {
        productionYearTextField.text = titleType[row]
    }
    func selectTitleByFuelTextField(row: Int) {
        fuelTextField.text = titleType[row]
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
            return titleType.count
        } else if pickerView == brandTextField {
            return titleBrand.count
        } else if pickerView == modelTypeTextField {
            return titleModelType.count
        } else if pickerView == productionYearTextField {
            return titleProductionYear.count
        } else if pickerView == fuelTextField {
            return titleFuel.count
        }
        return 0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == typeTextField {
            return titleType[row]
        } else if pickerView == brandTextField {
            return titleBrand[row]
        } else if pickerView == modelTypeTextField {
            return titleModelType[row]
        } else if pickerView == productionYearTextField {
            return titleProductionYear[row]
        } else if pickerView == fuelTextField {
            return titleFuel[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == typeTextField {
            return selectTitleByTypeTextField(row: row)
        } else if pickerView == brandTextField {
            return selectTitleByBrandTextField(row: row)
        } else if pickerView == modelTypeTextField {
            return selectTitleByModelTypeTextField(row: row)
        } else if pickerView == productionYearTextField {
            return selectTitleByProductionYearTextField(row: row)
        } else if pickerView == fuelTextField {
            return selectTitleByFuelTextField(row: row)
        }
    }
}
