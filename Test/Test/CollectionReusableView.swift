//
//  CollectionReusableView.swift
//  Test
//
//  Created by Jijo on 21/09/21.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.myCustomInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.myCustomInit()
    }
    
    func myCustomInit() {
        print("hello there from SupView")
    }
}
