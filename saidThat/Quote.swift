

import Foundation

class Quote: PFObject, PFSubclassing
{

    override class func initialize()
    {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken)
            {
                self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String
    {
        return "Quote"
    }
    
    @NSManaged var quoteText : String
    
}
