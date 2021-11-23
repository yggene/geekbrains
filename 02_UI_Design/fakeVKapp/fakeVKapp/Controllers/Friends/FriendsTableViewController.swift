//
//  FriendsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 22.08.2021.
//

import UIKit
import RealmSwift

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: Variables
    
    private let networkService = NetworkService()
    private var friends: Results<User>?
    private var friendsNotification: NotificationToken?
    private var friendsDictionary = [Character:[User]]()
    private var lastNamesFirstLetters: [Character] {
        get {
            friendsDictionary.keys.sorted()
        }
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        fetchFriends()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        friendsNotification?.invalidate()
    }
    
    // MARK: Methods
    
    private func loadFriendsFromRealm() {
        
        friends = try? RealmService.load(typeOf: User.self)
        friendsDictionary = self.updateFriendsDictionary(with: nil)
        
        self.friendsNotification = friends?.observe { [weak self] realmChange in
            switch realmChange {
            case .initial(let objects):
                if objects.count > 0 {
                    self?.friends = objects
                    self?.tableView.reloadData()
                }
            case let .update(objects, deletions, insertions, modifications):
                self?.friends = objects
                self?.tableView.beginUpdates()
                self?.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                           with: .none)
                self?.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                           with: .none)
                self?.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                           with: .none)
                self?.tableView.endUpdates()
            case .error(let error):
                print(error)
            }
        }
    }
    
    // get friends data on API call
    private func fetchFriends() {
        networkService.getFriends { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success:
                self?.loadFriendsFromRealm()
                print("Fetch friends successful!")
            case .failure(let requestError):
                switch requestError {
                case .invalidUrl:
                    print("Error: Invalid URL detected")
                case .errorDecode:
                    print("Error: Decode problem. Check the JSON data")
                case .failedRequest:
                    print("Error: Request failed")
                case .unknownError:
                    print("Error: Unknown")
                case .realmSaveFailure:
                    print("Error: Could not save to Realm")
                }
            }
        }
    }
    
    private func updateFriendsDictionary(with searchText: String?) -> [Character:[User]]{
        var friendsCopy = Array(friends!)
        if let text = searchText?.lowercased(), searchText != "" {
            friendsCopy = friendsCopy.filter{
                $0.firstName.lowercased().contains(text) || $0.lastName.lowercased().contains(text) }
        }
        return Dictionary(grouping: friendsCopy) { $0.lastName.lowercased().first ?? "👽" }
    }
    
    internal func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        friendsDictionary = updateFriendsDictionary(with: searchText)
        tableView.reloadData()
    }
    
    // transfer data for the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination
                as? FriendPhotoCollectionViewController else { return }
        
        if let index = tableView.indexPathForSelectedRow {
            let key = lastNamesFirstLetters[index.section]
            let selectedFriends = friendsDictionary[key]
            guard let friend = selectedFriends?[index.row] else { return }
            destinationController.friendProfile = friend
        }
    }
}

// MARK: Table view data source

extension FriendsTableViewController {
    
    // number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        friendsDictionary.keys.count
    }
    
    // number of rows in sections
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            friendsDictionary[lastNamesFirstLetters[section]]?.count ?? 0
        }
    
    // configuring cells
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "friendCell",
                for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
            
            let key = lastNamesFirstLetters[indexPath.section]
            let selectedFriends = friendsDictionary[key]
            guard let key = selectedFriends?[indexPath.row] else { return cell }
            cell.configure(with: key)
            
            return cell
        }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            performSegue(withIdentifier: "friendPhotoSegue",
                         sender: nil)
        }
    
    // configuring sections' headers
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int) -> String? {
            return String(lastNamesFirstLetters[section].uppercased())
        }
    
    // sections' headers' height
    override func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int) -> CGFloat {
            15.0
        }
    
    // sections' headers' style
    override func tableView(
        _ tableView: UITableView,
        willDisplayHeaderView view: UIView,
        forSection section: Int) {
            let header = view as! UITableViewHeaderFooterView
            header.textLabel?.font = UIFont.systemFont(ofSize: 14)
        }
}

extension FriendsTableViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
}
