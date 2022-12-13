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
    @IBOutlet weak var resultLabel: UILabel!
    
    let typePickerView = UIPickerView()
    let brandPickerView = UIPickerView()
    let modelTypePickerView = UIPickerView()
    let productionYearPickerView = UIPickerView()
    let fuelPickerView = UIPickerView()
    
    let typesList = TypeElement.allCases
    let brandList = BrandElement.allCases
    let modelTypesList = ModelTypeElement.allCases
    let productionYearsList = ProductionYearElement.allCases
    let fuelList = FuelElement.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCarTypeSegmentControl()
        configyreTextField()
        configureDrumTextField()
        priceTextField.becomeFirstResponder()
        resetResulLable()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func calculateDidTap(_ sender: Any) {
//        let type = Int(typeTextField.text ?? "") ?? 0
//        let brand = Int(brandTextField.text ?? "") ?? 0
//        let modelType = Int(modelTypeTextField.text ?? "") ?? 0
//        let productionYear = Int(productionYearTextField.text ?? "") ?? 0
//        let fuel = Int(fuelTextField.text ?? "") ?? 0
        let price = Int(priceTextField.text ?? "") ?? 0
        
        let typeIndex = typePickerView.selectedRow(inComponent: 0)
        let typeForResult = typesList[typeIndex]
        let typeValue = typeForResult.value
        
        let brandIndex = brandPickerView.selectedRow(inComponent: 0)
        let brandForResult = brandList[brandIndex]
        let brandValue = brandForResult.value
        
        let modelTypeIndex = modelTypePickerView.selectedRow(inComponent: 0)
        let modelTypeForResult = modelTypesList[modelTypeIndex]
        let modelTypeValue = modelTypeForResult.value
        
        let productionYearIndex = productionYearPickerView.selectedRow(inComponent: 0)
        let productionYearForResult = productionYearsList[productionYearIndex]
        let productionYearValue = productionYearForResult.value
        
        let fuelIndex = typePickerView.selectedRow(inComponent: 0)
        let fuelForResult = fuelList[fuelIndex]
        let fuelValue = fuelForResult.value
        
        guard let selectedUkraineOrUSA = CountryCar(rawValue: carTypeSegmentControl.selectedSegmentIndex) else { return }
        
        switch selectedUkraineOrUSA {
        case .ukraine:
//            let sumOfValues = typeValue + brandValue + modelTypeValue + productionYearValue + fuelValue
            let result = 1 * typeValue + 1 * brandValue + 1 * modelTypeValue + 1 * productionYearValue + 1 * fuelValue + 1 * price
            showAlertWith(title: String(result))
            
        case .usa:
//            let sumOfValues = typeValue + brandValue + modelTypeValue + productionYearValue + fuelValue
            let result = 1.2 * Double(typeValue) + 1.2 * Double(brandValue) + 1.2 * Double(modelTypeValue) + 1.2 * Double(productionYearValue) + 1.2 * Double(fuelValue) + 1.2 * Double(price)
            showAlertWith(title: String(Int(result)))
        }
    }
    
    func showAlertWith(title: String) {
        let alert = UIAlertController(title: "You result", message: title, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .cancel))
        self.present(alert, animated: true)
    }
    
    @IBAction func UkraineAndUSADidChange(_ sender: UISegmentedControl) {
        clear()
    }
    
    @IBAction func clearDidTap(_ sender: Any) {
        clear()
    }
    
    func resetResulLable() {
        resultLabel.text = nil
    }
    
    func clear() {
        typePickerView.selectRow(0, inComponent: 0, animated: true)
        selectTitleByTypeTextField(row: 0)
        brandPickerView.selectRow(0, inComponent: 0, animated: true)
        selectTitleByBrandTextField(row: 0)
        modelTypePickerView.selectRow(0, inComponent: 0, animated: true)
        selectTitleByModelTypeTextField(row: 0)
        productionYearPickerView.selectRow(0, inComponent: 0, animated: true)
        selectTitleByProductionYearTextField(row: 0)
        fuelPickerView.selectRow(0, inComponent: 0, animated: true)
        selectTitleByFuelTextField(row: 0)
        priceTextField.text = nil
        
        priceTextField.becomeFirstResponder()
        
        resetResulLable()
    }
    
    func configureCarTypeSegmentControl() {
        carTypeSegmentControl.removeAllSegments()
        carTypeSegmentControl.insertSegment(withTitle: CountryCar.ukraine.title, at: 0, animated: false)
        carTypeSegmentControl.insertSegment(withTitle: CountryCar.usa.title, at: 1, animated: false)
        carTypeSegmentControl.selectedSegmentIndex = 0
    }
    
    func configyreTextField() {
        priceTextField.delegate = self
        priceTextField.keyboardType = .numberPad
    }
    
    func configureDrumTextField() {
        typePickerView.dataSource = self
        brandPickerView.dataSource = self
        modelTypePickerView.dataSource = self
        productionYearPickerView.dataSource = self
        fuelPickerView.dataSource = self
        
        typePickerView.delegate = self
        brandPickerView.delegate = self
        modelTypePickerView.delegate = self
        productionYearPickerView.delegate = self
        fuelPickerView.delegate = self
        
        typeTextField.inputView = typePickerView
        brandTextField.inputView = brandPickerView
        modelTypeTextField.inputView = modelTypePickerView
        productionYearTextField.inputView = productionYearPickerView
        fuelTextField.inputView = fuelPickerView
        
        selectTitleByTypeTextField(row: 0)
        selectTitleByBrandTextField(row: 0)
        selectTitleByModelTypeTextField(row: 0)
        selectTitleByProductionYearTextField(row: 0)
        selectTitleByFuelTextField(row: 0)
    }
    
    func selectTitleByTypeTextField(row: Int) {
        typeTextField.text = typesList[row].title
    }
    
    func selectTitleByBrandTextField(row: Int) {
        brandTextField.text = brandList[row].title
    }
    
    func selectTitleByModelTypeTextField(row: Int) {
        modelTypeTextField.text = modelTypesList[row].title
    }
    
    func selectTitleByProductionYearTextField(row: Int) {
        productionYearTextField.text = String(productionYearsList[row].title)
    }
    
    func selectTitleByFuelTextField(row: Int) {
        fuelTextField.text = fuelList[row].title
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
        if pickerView == typePickerView {
            return typesList.count
        } else if pickerView == brandPickerView {
            return brandList.count
        } else if pickerView == modelTypePickerView {
            return modelTypesList.count
        } else if pickerView == productionYearPickerView {
            return productionYearsList.count
        } else if pickerView == fuelPickerView {
            return fuelList.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == typePickerView {
            return typesList[row].title
        } else if pickerView == brandPickerView {
            return brandList[row].title
        } else if pickerView == modelTypePickerView {
            return modelTypesList[row].title
        } else if pickerView == productionYearPickerView {
            return productionYearsList[row].title
        } else if pickerView == fuelPickerView {
            return fuelList[row].title
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == typePickerView {
            return selectTitleByTypeTextField(row: row)
        } else if pickerView == brandPickerView {
            return selectTitleByBrandTextField(row: row)
        } else if pickerView == modelTypePickerView {
            return selectTitleByModelTypeTextField(row: row)
        } else if pickerView == productionYearPickerView {
            return selectTitleByProductionYearTextField(row: row)
        } else if pickerView == fuelPickerView {
            return selectTitleByFuelTextField(row: row)
        }
    }
}
