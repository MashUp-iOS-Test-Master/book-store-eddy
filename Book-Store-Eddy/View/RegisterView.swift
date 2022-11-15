//
//  RegisterView.swift
//  Book-Store-Eddy
//
//  Created by Kyunghun Kim on 2022/11/15.
//

import UIKit

final class RegisterView: UIView {
    private let categories: [Category]?
    
    lazy var bookTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "책 제목 입력"
        
        return textField
    }()
    
    lazy var categoryPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        
        return pickerView
        
    }()
    
    lazy var publicationDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.locale = Locale(identifier: "ko_KR")
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        return datePicker
    }()
    
    lazy var categoryTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "책 카테고리"
        return textField
    }()
    
    lazy var publicationDateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "출판 일자"
        return textField
    }()
    
    lazy var priceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "가격 입력"
        
        return textField
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("등록", for: .normal)
        button.backgroundColor = .gray
        
        return button
    }()
    
    init(categories: [Category] = Category.allCases) {
        self.categories = categories
        super.init(frame: .zero)
        self.backgroundColor = .white
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didSelectCategory(at index: Int) {
        guard let selectedCategory = self.categories?[index] else { return }
        self.categoryTextField.text = selectedCategory.title
    }
    
    private func setLayout() {
        self.addSubview(infoStackView)
        
        infoStackView.addArrangedSubviews(with: [bookTextField, categoryTextField, publicationDateTextField, priceTextField, registerButton])
        
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            infoStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            infoStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

