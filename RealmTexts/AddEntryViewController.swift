import UIKit
import RealmSwift

class AddEntryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentTextField: UITextField!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let passedEntry = entry {
            titleTextField.text = passedEntry.title
            contentTextField.text = passedEntry.content
        }
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        
        if let title = titleTextField.text {
            if let content = contentTextField.text {
                if let passedEntry = entry {
                    // UPDATE
                    let realm = try? Realm()
                    
                    try? realm?.write {
                        passedEntry.title = title
                        passedEntry.content = content
                    }
                } else {
                    // ADD
                    let newEntry = Entry()
                    newEntry.title = title
                    newEntry.content = content
                    
                    let realm = try? Realm()
                    
                    try? realm?.write {
                        realm?.add(newEntry)
                    }
                }
                
                navigationController?.popViewController(animated: true)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
