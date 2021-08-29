//
//  MyGroupsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 27.08.2021.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    var myGroups = [Group(name: "Narnia Dimension",
                          image: UIImage(named: "group-narnia-dimension"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //unwind segue
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        // Проверяем идентификатор перехода
        if segue.identifier == "addGroupSegue" {
            // Получаем ссылку на контроллер, с которого осуществлен переход
            guard let groupAdd = segue.source as?
                    AllGroupsTableViewController else { return }
            // Получаем индекс выделенной ячейки
            if let indexPath = groupAdd.tableView.indexPathForSelectedRow {
                // Получаем группу по индексу
                let selectedGroup = groupAdd.allGroups[indexPath.row]
                // Проверяем на наличие дубликата
                 if !myGroups.contains(selectedGroup) {
                    // добавляем город в список
                    myGroups.append(selectedGroup)
                    // обновляем таблицу
                    tableView.reloadData()
                    // и ни хрена не работает :D
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupsCell", for: indexPath) as? MyGroupsTableViewCell else { return UITableViewCell() }
        
        // Configure the cell...
        tableView.separatorStyle = .none
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.cornerRadius = 5
        
        let currentGroup = myGroups[indexPath.row]
        
        cell.textLabel?.text = currentGroup.name
        cell.imageView?.image = currentGroup.image
        
        return cell
    }
    
    // Метод выделения ячейки
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
        
        defer {
            // Метод для снятия выделения с ячейки
            tableView.deselectRow(at: indexPath, animated: true)
        }

    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
            // Если была нажата кнопка «Удалить»
            if editingStyle == .delete {
            // Удаляем город из массива
                myGroups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
}
