import UIKit
import CoreData

class ViewController: UIViewController {

    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //===> show user data
        println("-------------------------------")
        println("User Data already in the iPhone")
        var users = User.get_fetchAllUsers(managedObjectContext!) as [User]
        for us in users {
            us.print()
        }
        

        //===> save new users
        User.set_createUserInMOC(managedObjectContext!,
            user_ID: "user_1",
            settings: Settings(num: 1) )
        
        User.set_createUserInMOC(managedObjectContext!,
            user_ID: "user_2",
            settings: Settings(num: 2) )
        
        self.managedObjectContext?.save(nil)
        
        
        //===> show user data
        println("-------------------------------")
        println("User Data already in the iPhone and saved now")
        var users2 = User.get_fetchAllUsers(managedObjectContext!) as [User]
        for us in users2 {
            us.print()
        }
        
        
        //===> try to get the settings from saved user settings
        println("-------------------------------")
        println("User Data and Settings")
        var users3 = User.get_fetchAllUsers(managedObjectContext!) as [User]
        for us in users3 {
            us.printPlusSettings()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

