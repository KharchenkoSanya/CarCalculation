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
    
    let titleType = TypeElement.allCases
    let titleBrand = BrandElement.allCases
    let titleModelType = ModelTypeElement.allCases
    let titleProductionYear = ProductionYearElement.allCases
    let titleFuel = FuelElement.allCases
    
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
        let type = Int(typeTextField.text ?? "") ?? 0
        let brand = Int(brandTextField.text ?? "") ?? 0
        let modelType = Int(modelTypeTextField.text ?? "") ?? 0
        let productionYear = Int(productionYearTextField.text ?? "") ?? 0
        let fuel = Int(fuelTextField.text ?? "") ?? 0
        let price = Int(priceTextField.text ?? "") ?? 0
        
        let typeIndex = pickerViewType.selectedRow(inComponent: 0)
        let typeForResult = titleType[typeIndex]
        let typeValue = typeForResult.title
        
        
        let brandIndex = pickerViewBrand.selectedRow(inComponent: 0)
        let brandForResult = titleBrand[brandIndex]
        let brandValue = brandForResult.title
        
        let modelTypeIndex = pickerViewModelType.selectedRow(inComponent: 0)
        let modelTypeForResult = titleModelType[modelTypeIndex]
        let modelTypeValue = modelTypeForResult.title
        
        let productionYearIndex = pickerViewProductionYear.selectedRow(inComponent: 0)
        let productionYearForResult = titleProductionYear[productionYearIndex]
        let productionYearValue = productionYearForResult.title
        
        
        let fuelIndex = pickerViewType.selectedRow(inComponent: 0)
        let fuelForResult = titleFuel[fuelIndex]
        let fuelValue = fuelForResult.title
        
        
        guard let selectedUkrainOrUSA = CountryCar(rawValue: carTypeSegmentControl.selectedSegmentIndex) else { return }
        
        switch selectedUkrainOrUSA {
        case .ukrain:
            let sumOfValues = typeValue + brandValue + modelTypeValue + productionYearValue + fuelValue
            let result = 1 * type + 1 * brand + 1 * productionYear + 1 * fuel + 1 * price + sumOfValues
            showAlertWith(title: String(result))
            
        case .usa:
            let sumOfValues = typeValue + brandValue + modelTypeValue + productionYearValue + fuelValue
            let result = 1.2 * Double(type) + 1.2 * Double(brand) + 1.2 * Double(productionYear) + 1.2 * Double(fuel) + 1.2 * Double(price) + Double(sumOfValues)
            showAlertWith(title: String(Int(result)))
        }
    }
    
    func showAlertWith(title: String) {
        let alert = UIAlertController(title: "You result", message: title, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .cancel))
        self.present(alert, animated: true)
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
        carTypeSegmentControl.insertSegment(withTitle: CountryCar.ukrain.title, at: 0, animated: false)
        carTypeSegmentControl.insertSegment(withTitle: CountryCar.usa.title, at: 1, animated: false)
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
        typeTextField.text = titleType[row].title
    }
    func selectTitleByBrandTextField(row: Int) {
        brandTextField.text = titleBrand[row].title
    }
    func selectTitleByModelTypeTextField(row: Int) {
        modelTypeTextField.text = titleModelType[row].title
    }
    func selectTitleByProductionYearTextField(row: Int) {
        productionYearTextField.text = String(titleProductionYear[row].title)
    }
    func selectTitleByFuelTextField(row: Int) {
        fuelTextField.text = titleFuel[row].title
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
            return titleType[row].title
        } else if pickerView == pickerViewBrand {
            return titleBrand[row].title
        } else if pickerView == pickerViewModelType {
            return titleModelType[row].title
        } else if pickerView == pickerViewProductionYear {
            return titleProductionYear[row].title
        } else if pickerView == pickerViewFuel {
            return titleFuel[row].title
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
