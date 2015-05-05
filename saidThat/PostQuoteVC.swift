//
//  PostQuoteVC.swift
//  saidThat
//
//  Created by Thomas Gibbons on 5/1/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class PostQuoteVC: UIViewController, UITextViewDelegate
{
    @IBOutlet weak var submitButtonTap: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var quoteTextView: UITextView!
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.quoteTextView.text = "So she tells me she's on her period...so I was like, is you butt on its period??"
        self.quoteTextView.textColor = UIColor.lightGrayColor()
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")

    }
    
    func textViewDidBeginEditing(textView: UITextView)
    {
        self.quoteTextView.text = ""
    }
    
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func submitButtonTap(sender: AnyObject)
    {
        let string = String(stringInterpolation: "You are about to post a quote to ", self.phoneNumberTextField.text)
        
        let alert = UIAlertController(title: string, message: "Testing", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: .Default , handler:
            {
                (action2) -> Void in
                alert .dismissViewControllerAnimated(true, completion: nil)
                
                let newQuote = Quote()
                newQuote.quoteText = self.quoteTextView.text;
                
                
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default , handler:
            {
                (action1) -> Void in
                alert .dismissViewControllerAnimated(true, completion: nil)
            }))
     
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

}
