//
//  SettingViewController.swift
//  ShlagBaumSGG
//
//  Created by Александр Пономаренко on 16.09.14.
//  Copyright (c) 2014 Александр Пономаренко. All rights reserved.
//

import UIKit





class SettingViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet var textField2: UITextField! = nil
    @IBOutlet var textField: UITextField! = nil
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var scrollTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField2.delegate = self
        registerForKeyboardNotifications()
        contentView.bounds.size.height = scrollView.bounds.size.height

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //textField.resignFirstResponder()
        self.view.endEditing(true)
        
    }
    
    func registerForKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillShow:",
            name: UIKeyboardWillShowNotification,
            object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillHide:",
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo as [String:AnyObject]
        let kbSize = info[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue()
        let contentInsets = UIEdgeInsetsMake(0, 0, kbSize.height, 0)
        println("Show \(kbSize.height)")
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        var aRect = self.view.frame
        aRect.size.height -= kbSize.height
        
        if (!CGRectContainsPoint(aRect, self.view.frame.origin)){
            self.scrollView.scrollRectToVisible(self.view.frame, animated: true)
        }
        

        //contentView.bounds.size.height = contentView.bounds.size.height - kbSize.height
        //scrollTop.constant = kbSize.height;
        //scrollView.scrollIndicatorInsets.bottom = 10;
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
       println("Hide")
    
    }
    
    func keyboardWasShow (notification: NSNotification) {
        let info = notification.userInfo as [String:AnyObject]
        let kbSize = info[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue()
        var bkgndRect = self.view.frame
        bkgndRect.size.height += kbSize.height
        self.view.frame = bkgndRect
        scrollView.setContentOffset(CGPointMake(0, self.view.frame.origin.y - kbSize.height), animated: true)
    }
    
    
    override func viewDidLayoutSubviews() {
        
        let scrollViewBounds = scrollView.bounds
        let containerViewBounds = contentView.bounds
        
        var scrollViewInsets = UIEdgeInsetsZero
        scrollViewInsets.top = scrollViewBounds.size.height/2.0;
        scrollViewInsets.top -= contentView.bounds.size.height/2.0;
        
        scrollViewInsets.bottom = scrollViewBounds.size.height/2.0
        scrollViewInsets.bottom -= contentView.bounds.size.height/2.0;
        scrollViewInsets.bottom += 1
        
        //scrollView.contentInset = scrollViewInsets
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func done(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
