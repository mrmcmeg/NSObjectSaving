NSObjectSaving
==============

- xCode 6.1
- Swift


I'm trying to save a NSObject (called Settings) as attribute of the class (and Entity) of User.

I'd like do something like this:

# User.swift
    class User: NSManagedObject {
        @NSManaged var user_ID: String
        @NSManaged var settings: Settings // by class Settings: NSObject, NSCoding {
    ...

# Settings.swift
    class Settings: NSObject, NSCoding {
        var just_this : Int32!
    ...

# ViewController.swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user = User.get_fetchUser(managedObjectContext!, user_ID: "user_1") as User // "user_1" previous saved
        let sett = Settings.my_loadSaved(user.settings) // trasform the NSData object into Settings object
        println(sett.just_this)
    ...
