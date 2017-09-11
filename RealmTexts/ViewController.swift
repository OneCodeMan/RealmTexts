import UIKit
import RealmSwift

class Entry: Object {
    dynamic var title = ""
    dynamic var content = ""
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var realmEntries: Results<Entry>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try? Realm()
        realmEntries = realm?.objects(Entry.self)
        
        tableView.delegate = self
        tableView.dataSource = self

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = realmEntries?.count {
            return count
        }
        
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath)
        let entry = realmEntries?[indexPath.row]
        
        cell.textLabel?.text = entry?.title
        
        return cell
    }

}

