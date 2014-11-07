import UIKit


class Settings: NSObject, NSCoding {
    
    var just_this : Int32!
    
    override init() {
        super.init()
    }
    
    init(num: Int32){
        super.init()
        just_this = num
    }

    // MARK: NSCoding
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.just_this = decoder.decodeInt32ForKey("just_this")
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeInt32(Int32(self.just_this), forKey: "just_this")
    }
    
    
//    func my_save() -> NSData {
//        let data = NSKeyedArchiver.archivedDataWithRootObject(self)
////        NSUserDefaults.standardUserDefaults().setObject(data, forKey: "settings")
//
//        return data
//    }
//    
//    func my_clear() {
//        NSUserDefaults.standardUserDefaults().removeObjectForKey("settings")
//    }
//    
//    class func my_loadSaved(dataStored: NSData) -> Settings? {
//        
//        if dataStored.isEqual(nil) {
//            println("no dataStored in my_loadSaved()")
//            return nil
//
//        }
////        if let data = NSUserDefaults.standardUserDefaults().objectForKey("settings") as? NSData {
////        return NSKeyedUnarchiver.unarchiveObjectWithData(data) as? Settings
//        if let data = NSKeyedUnarchiver.unarchiveObjectWithData(dataStored) as? Settings {
//            return data
//        }
////        }
//        println("my_loadSaved() error...")
//        return nil
//    }

}
