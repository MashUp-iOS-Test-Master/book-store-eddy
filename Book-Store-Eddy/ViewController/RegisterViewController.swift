//
//  RegisterViewController.swift
//  Book-Store-Eddy
//
//  Created by Eddy on 2022/10/24.
//

import UIKit

final class RegisterViewController: UIViewController {
    private let registerView = RegisterView()
    private let pickerValues: [String] = ["소설", "기술", "경제", "시집"]
    private let dataManager = PersistentManager()
    
    override func loadView() {
        super.loadView()
        self.view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        registerView.categoryPickerView.delegate = self
        registerView.categoryPickerView.dataSource = self
        registerView.registerButton.addTarget(self, action: #selector(registerButtonDidTapped), for: .touchUpInside)
        configure(registerView.categoryTextField, inputView: registerView.categoryPickerView)
        configure(registerView.publicationDateTextField, inputView: registerView.publicationDatePicker)
    }
    
    private func configure(_ categoryTextField: UITextField, inputView: UIPickerView) {
        categoryTextField.inputView = inputView
        inputView.dataSource = self
        inputView.delegate = self
    }
    
    private func configure(_ dateTextField: UITextField, inputView: UIDatePicker) {
        dateTextField.inputView = inputView
        inputView.preferredDatePickerStyle = .wheels
        inputView.datePickerMode = .date
        inputView.addTarget(self, action: #selector(self.didEndEditing(datePicker:)), for: .allEvents)
    }
    
    @objc private func didEndEditing(datePicker: UIDatePicker) {
        let convertedDate = datePicker.date.fullDateString(.full)
        registerView.publicationDateTextField.text = convertedDate
    }
    
    @objc private func registerButtonDidTapped() {
        dataManager.save(book: Book(
            name: registerView.bookTextField.text ?? "",
            category: registerView.categoryTextField.text ?? "",
            publicationDate: registerView.publicationDateTextField.text ?? "",
            price: registerView.priceTextField.text ?? ""
        ))
        self.navigationController?.popViewController(animated: true)
    }
}

extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        registerView.didSelectCategory(at: row)
    }
}
