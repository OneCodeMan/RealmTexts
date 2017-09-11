import UIKit
import RealmSwift

class Entry: Object {
    dynamic var title = ""
    dynamic var content = ""
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var realmEntries: Results<Entry>!
    let realm = try? Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let entries = [
            "First Post": "My First Post",
            "Second Post": "Second blog post",
            "naRCOs": "Season 3 is awesome"
        ]
        
        /*
        for (title, body) in entries {
            let entry = Entry()
            entry.title = title
            entry.content = body
            
            try? realm?.write {
                realm?.add(entry)
            }
        }
        */
    
        
        realmEntries = realm?.objects(Entry.self)
        print(realmEntries)
        print(realmEntries.count)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realmEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath)
        //let textInfo = realmEntries(forSection: indexPath.section)[indexPath.row]
        
        cell.textLabel?.text = "Brotha"
        
        return cell
    }

}

