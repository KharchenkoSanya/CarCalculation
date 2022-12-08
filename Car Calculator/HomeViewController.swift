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
    @IBOutlet weak var resultLable: UILabel!
    
    let pickerViewType = UIPickerView()
    let pickerViewBrand = UIPickerView()
    let pickerViewModelType = UIPickerView()
    let pickerViewProductionYear = UIPickerView()
    let pickerViewFuel = UIPickerView()
    
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
        priceTextField.becomeFirstResponder()
        resetResulLable()
    }
    
    
    @IBAction func calculateDidTap(_ sender: Any) {
        let type = Int(typeTextField.text ?? "") ?? 0
        let brand = Int(brandTextField.text ?? "") ?? 0
        let modelType = Int(modelTypeTextField.text ?? "") ?? 0
        let productionYear = Int(productionYearTextField.text ?? "") ?? 0
        let fuel = Int(fuelTextField.text ?? "") ?? 0
        let price = Int(priceTextField.text ?? "") ?? 0
        
        let typeIndex = pickerViewType.selectedRow(inComponent: 0)
        let typeForResult = titleType[typeIndex]
        var typeValue = 0
        switch typeForResult {
        case "Sedan":
            typeValue = 50
        case "Coupe":
            typeValue = 200
        case "Station wagon":
            typeValue = 300
        case "Minivan":
            typeValue = 80
        default: break
        }
        
        let brandIndex = pickerViewBrand.selectedRow(inComponent: 0)
        let brandForResult = titleBrand[brandIndex]
        var brandValue = 0
        switch brandForResult {
        case "Audi":
            brandValue = 1000
        case "BMW":
            brandValue = 1100
        case "Mazda":
            brandValue = 400
        case "Mercedes-Benz":
            brandValue = 800
        case "Volkswagen":
            brandValue = 500
        default: break
        }
        
        let productionYearIndex = pickerViewProductionYear.selectedRow(inComponent: 0)
        let productionYearForResult = titleProductionYear[brandIndex]
        var productionYearValue = 0
        switch productionYearForResult {
        case "2015":
            productionYearValue = 500
        case "2016":
            productionYearValue = 1000
        case "2017":
            productionYearValue = 1500
        case "2018":
            productionYearValue = 2000
        case "2019":
            productionYearValue = 3000
        case "2020":
            productionYearValue = 4000
        case "2021":
            productionYearValue = 5000
        case "2022":
            productionYearValue = 8000
        default: break
        }
        
        let fuelIndex = pickerViewType.selectedRow(inComponent: 0)
        let fuelForResult = titleFuel[fuelIndex]
        var fuelValue = 0
        switch fuelForResult {
        case "Petrol":
            fuelValue = 50
        case "Diesel":
            fuelValue = 200
        case "Gas":
            fuelValue = 300
        case "Electro":
            fuelValue = 80
        default: break
        }
        
        let selectedUkrainOrUSA = carTypeSegmentControl.selectedSegmentIndex
        var result = ""
        switch selectedUkrainOrUSA {
        case 0:
            let result = 1 * type + 1 * brand + 1 * productionYear + 1 * fuel + 1 * price + typeValue + brandValue + productionYearValue + fuelValue
            showAlertWith(title: String(result))
            
        case 1:
            let result = 1.2 * type + 1.2 * brand + 1.2 * productionYear + 1.2 * fuel + 1.2 * price + typeValue + brandValue + productionYearValue + fuelValue
            showAlertWith(title: String(result))
            
        default: ()
        }
    }
    
    func showAlertWith(title: String) {
        let alert = UIAlertController(title: "You result", message: title, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .cancel))
    }
    
    @IBAction func UkrainAndUSADidChange(_ sender: UISegmentedControl) {
        clear()
    }
    
    @IBAction func clearDidTap(_ sender: Any) {
        clear()
    }
    
    func resetResulLable() {
        resultLable.text = nil
    }
    
    func clear() {
        pickerViewType.selectRow(0, inComponent: 0, animated: true)
        selectTitleByTypeTextField(row: 0)
        pickerViewBrand.selectRow(0, inComponent: 0, animated: true)
        selectTitleByBrandTextField(row: 0)
        pickerViewModelType.selectRow(0, inComponent: 0, animated: true)
        selectTitleByModelTypeTextField(row: 0)
        pickerViewProductionYear.selectRow(0, inComponent: 0, animated: true)
        selectTitleByProductionYearTextField(row: 0)
        pickerViewFuel.selectRow(0, inComponent: 0, animated: true)
        selectTitleByFuelTextField(row: 0)
        priceTextField.text = nil
        
        priceTextField.becomeFirstResponder()
        
        resetResulLable()
    }
    
    
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
        pickerViewType.dataSource = self
        pickerViewBrand.dataSource = self
        pickerViewModelType.dataSource = self
        pickerViewProductionYear.dataSource = self
        pickerViewFuel.dataSource = self
        
        pickerViewType.delegate = self
        pickerViewBrand.delegate = self
        pickerViewModelType.delegate = self
        pickerViewProductionYear.delegate = self
        pickerViewFuel.delegate = self
        
        typeTextField.inputView = pickerViewType
        brandTextField.inputView = pickerViewBrand
        modelTypeTextField.inputView = pickerViewModelType
        productionYearTextField.inputView = pickerViewProductionYear
        fuelTextField.inputView = pickerViewFuel
        
        selectTitleByTypeTextField(row: 0)
        selectTitleByBrandTextField(row: 0)
        selectTitleByModelTypeTextField(row: 0)
        selectTitleByProductionYearTextField(row: 0)
        selectTitleByFuelTextField(row: 0)
    }
    
    func selectTitleByTypeTextField(row: Int) {
        typeTextField.text = titleType[row]
    }
    func selectTitleByBrandTextField(row: Int) {
        brandTextField.text = titleBrand[row]
    }
    func selectTitleByModelTypeTextField(row: Int) {
        modelTypeTextField.text = titleModelType[row]
    }
    func selectTitleByProductionYearTextField(row: Int) {
        productionYearTextField.text = String(titleProductionYear[row])
    }
    func selectTitleByFuelTextField(row: Int) {
        fuelTextField.text = titleFuel[row]
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
        if pickerView == pickerViewType {
            return titleType.count
        } else if pickerView == pickerViewBrand {
            return titleBrand.count
        } else if pickerView == pickerViewModelType {
            return titleModelType.count
        } else if pickerView == pickerViewProductionYear {
            return titleProductionYear.count
        } else if pickerView == pickerViewFuel {
            return titleFuel.count
        }
        return 0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerViewType {
            return titleType[row]
        } else if pickerView == pickerViewBrand {
            return titleBrand[row]
        } else if pickerView == pickerViewModelType {
            return titleModelType[row]
        } else if pickerView == pickerViewProductionYear {
            return titleProductionYear[row]
        } else if pickerView == pickerViewFuel {
            return titleFuel[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerViewType {
            return selectTitleByTypeTextField(row: row)
        } else if pickerView == pickerViewBrand {
            return selectTitleByBrandTextField(row: row)
        } else if pickerView == pickerViewModelType {
            return selectTitleByModelTypeTextField(row: row)
        } else if pickerView == pickerViewProductionYear {
            return selectTitleByProductionYearTextField(row: row)
        } else if pickerView == pickerViewFuel {
            return selectTitleByFuelTextField(row: row)
        }
    }
}
