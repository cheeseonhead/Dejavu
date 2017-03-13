import UIKit

class GLPostCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    required init()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        super.init(collectionViewLayout: layout)
        
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.register(GLPostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCell")
        self.collectionView?.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        self.navigationItem.title = TitleConstant.postListVC.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 20, height: 130)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DummyData.existingPosts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! GLPostCollectionViewCell
        
        let currentPost = DummyData.existingPosts[indexPath.row]
        
        cell.imageView.image = currentPost.image
        cell.titleLabel.text = currentPost.title
        cell.descriptionLabel.text = currentPost.description
        
        cell.dateLabel.text = Post.dateFormatter.string(from: currentPost.date)
        return cell
    }
}