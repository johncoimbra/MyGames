//
//  AddEditViewController.swift
//  MyGames
//
//  Created by Luis Eduardo Silva Oliveira on 03/01/22.
//

import UIKit

class AddEditViewController: UIViewController {
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfConsole: UITextField!
    @IBOutlet weak var dpReleaseDate: UIDatePicker!
    @IBOutlet weak var btAddEdit: UIButton!
    @IBOutlet weak var btCover: UIButton!
    @IBOutlet weak var ivCover: UIImageView!
    
    var game: Game!
    
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    } ()
    
    var consolesManager = ConsolesManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        tfConsole.inputView = pickerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        consolesManager.loadConsoles(with: context)
    }
    
    
    @IBAction func addEditCover(_ sender: UIButton) {
        
    }
    
    @IBAction func addEditGame(_ sender: Any) {
        if game == nil {
            game = Game(context: context)
        }
        game.title = tfTitle.text
        game.releaseDate = dpReleaseDate.date
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        navigationController?.popViewController(animated: true)
        
        
    }
}

extension AddEditViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return consolesManager.consoles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let console = consolesManager.consoles[row]
        return console.name
    }
}
