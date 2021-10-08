//
//  FireStoreViewController.swift
//  Test
//
//  Created by Jijo on 04/10/21.
//

import UIKit
import Firebase

class FireStoreViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db.collection("users").addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            //              guard let data = document.data() else {
            //                print("Document data was empty.")
            //                return
            //              }
            for document in documentSnapshot!.documents {
                print("\(document.documentID) => \(document.documentID)")
            }
            print("Document Count",documentSnapshot!.documents.count)
        }
    }
    @IBAction func addAction(_ sender: Any) {
        
        // Add a second document with a generated ID.
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "Alan",
            "middle": "Mathison",
            "last": "Turing",
            "born": 1912,
            "timestamp": FieldValue.serverTimestamp()
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    @IBAction func ShowAction(_ sender: Any) {
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    @IBAction func galleryAction() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
}
// MARK: - UIImagePickerControllerDelegate

extension FireStoreViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let backgroundImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        let cropperViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CropperViewController") as! CropperViewController
        picker.dismiss(animated: false, completion: nil)
        self.navigationController?.pushViewController(cropperViewController, animated: true)
        
    }
}
