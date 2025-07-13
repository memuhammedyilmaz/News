//
//  SettingsViewController.swift
//  News
//
//  Created by Muhammed Yılmaz on 13.07.2025.
//
import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var TableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let switcher = UISwitch()
    
    private let appVerisonLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.text = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "?"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    
}


extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
           return SettingsSection.sections.count
       }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return SettingsSection.sections[section].items.count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
           let item = SettingsSection.sections[indexPath.section].items[indexPath.row]
           
           cell.textLabel?.text = item.title
           cell.imageView?.image = UIImage(systemName: item.iconName)
            cell.imageView?.tintColor = .label
           
           switch item.type {
           case .theme:
               let segmentedControl = UISegmentedControl(items: ["Light", "Dark"])
               cell.accessoryView = segmentedControl
           case .notification:
               cell.accessoryView = switcher
           case .rateApp, .privacyPolicy, .termOfUse:
               cell.accessoryType = .disclosureIndicator
           }
           
           return cell
       }

      
}

extension SettingsViewController {
    func configureView() {
        view.backgroundColor = .systemBackground
        addSubviews()
        configureLayout()
    }
    
    func addSubviews() {
        view.addSubview(TableView)
        view.addSubview(appVerisonLabel)
    }
    
    func configureLayout() {
        TableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        appVerisonLabel.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            $0.centerX.equalToSuperview()
        }
    }
}

#Preview {
    SettingsViewController()
}

