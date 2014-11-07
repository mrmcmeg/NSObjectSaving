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
    
    
    func my_save() -> NSData {
        return NSKeyedArchiver.archivedDataWithRootObject(self)
    }
    
    class func my_loadSaved(dataStored: NSData) -> Settings! {
        
        if let data = NSKeyedUnarchiver.unarchiveObjectWithData(dataStored) as? Settings {
            println("Loaded settings with just_this = \(data.just_this)")
            return data
        }

        println("my_loadSaved() error...")
        return nil
    }

}
