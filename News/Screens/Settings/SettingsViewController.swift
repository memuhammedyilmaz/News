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
        ThemeManager.shared.applySavedTheme()
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
                          segmentedControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "theme")
                          segmentedControl.addTarget(self, action: #selector(themeChanged(_:)), for: .valueChanged)
                          cell.accessoryView = segmentedControl
           case .notification:
               cell.accessoryView = switcher
               switcher.addTarget(self, action: #selector(notificationManager(_:)), for: .valueChanged)
           case .rateApp, .privacyPolicy, .termOfUse:
               cell.accessoryType = .disclosureIndicator
           }
           
           return cell
       }
    
    @objc func notificationManager(_ sender: UISwitch) {
        if sender.isOn {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                    print("Notifications enabled")
                } else if let error = error {
                    print("Error requesting notifications permission: \(error.localizedDescription)")
                } else {
                    print("Notifications permission denied")
                }
            }
        }
    }
    
    @objc func themeChanged(_ sender: UISegmentedControl) {
        let selectedThemeIndex = sender.selectedSegmentIndex
        let style: UIUserInterfaceStyle = selectedThemeIndex == 0 ? .light : .dark
        
        
        
        UIApplication.shared.connectedScenes.forEach { window in
            if let windowScene = window as? UIWindowScene {
                windowScene.windows.forEach { window in
                    window.overrideUserInterfaceStyle = style
                }
            }
        }
         
        ThemeManager.shared.saveTheme(selectedThemeIndex)
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

