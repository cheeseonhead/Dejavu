import UIKit

class GLPostCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    required init()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        super.init(collectionViewLayout: layout)
        
        self.collectionView?.backgroundColor = UIColor.blue
        
        self.collectionView?.register(GLPostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCell")
        
        self.collectionView?.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 20, height: 100)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        print("Creating cell")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath)
        print("Cell: \(cell)")
        return cell
    }
}
