import UIKit
import RealmSwift

class Entry: Object {
    dynamic var title = ""
    dynamic var content = ""
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let entries = [
            "First Post": "My First Post",
            "Second Post": "Second blog post",
            "naRCOs": "Season 3 is awesome"
        ]
        
        let realm = try? Realm()
        
        for (title, body) in entries {
            let entry = Entry()
            entry.title = title
            entry.content = body
            
            try? realm?.write {
                realm?.add(entry)
            }
        }
        
        let realmEntries = realm?.objects(Entry.self)
        print(realmEntries)
        
    }

}

