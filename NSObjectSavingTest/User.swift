import Foundation
import CoreData

class User: NSManagedObject {

    @NSManaged var user_ID: String
    @NSManaged var settings: NSData

    
    class func set_createUserInMOC(moc: NSManagedObjectContext,
        user_ID: String,
        settings: Settings
        ) -> User {
            
            let item = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: moc) as User
            item.user_ID        = user_ID
            item.settings       = settings.my_save()
            
            return item
    }
    
    
    class func get_fetchAllUsers(moc: NSManagedObjectContext!) -> [User] {
        let fetchRequest = NSFetchRequest(entityName: "User")
        let sortDescriptor = NSSortDescriptor(key: "user_ID", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let fetchResults = moc!.executeFetchRequest(fetchRequest, error: nil) as? [User] {
            return fetchResults
        }
        return []
    }
    
    class func get_fetchUser(moc: NSManagedObjectContext!, user_ID: String ) -> User {
        
        let fetchRequest = NSFetchRequest(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "user_ID LIKE %@", user_ID )
        return moc!.executeFetchRequest(fetchRequest, error: nil)?.first as User
    }
    
    func print() {
        if (!user_ID.isEmpty) { println("user_ID:        \(user_ID)") }else{ println("* NO user_ID") }
    }
    
    func printPlusSettings() {
        let sett = Settings.my_loadSaved(settings)
        if (!user_ID.isEmpty) {         println("# user_ID:        \(user_ID)") }else{ println("* NO user_ID") }
    }
}
