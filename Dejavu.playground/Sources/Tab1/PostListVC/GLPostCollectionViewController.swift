import UIKit
import MapKit

class GLPostCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    var postInDistanceOrder: [Post]!
    
    required init()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        
        super.init(collectionViewLayout: layout)
        
        collectionView?.backgroundColor = AppStyle.PostListBackgroundColor
        collectionView?.register(GLPostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCell")
        collectionView?.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        navigationItem.title = TitleConstant.postListVC.rawValue
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        navigationItem.setRightBarButton(plusButton, animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        print("reloading")
        collectionView?.reloadData()
        postInDistanceOrder = self.postsSortedInDistanceOrder(posts: DummyData.existingPosts)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DummyData.existingPosts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! GLPostCollectionViewCell
        
        let count = postInDistanceOrder.count
        let currentPost = postInDistanceOrder[count - indexPath.row - 1]
        
//        cell.imageView.image = currentPost.image
//        cell.titleLabel.text = currentPost.title
//        cell.descriptionLabel.text = currentPost.description
//        
//        cell.dateLabel.text = Post.dateFormatter.string(from: currentPost.date)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let viewPostViewController = ViewPostViewController(nibName: nil, bundle: nil)
        let count = postInDistanceOrder.count
        viewPostViewController.post = postInDistanceOrder[count - indexPath.row - 1]
        viewPostViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewPostViewController, animated: true)
    }
    
    func addButtonPressed()
    {
        let addPostViewController = AddPostNavigationController(nibName: nil, bundle: nil)
        present(addPostViewController, animated: true, completion: nil)
//        navigationController?.pushViewController(addPostViewController, animated: true)
    }
    
    func postsSortedInDistanceOrder(posts: [Post]) -> [Post]
    {
        let result = posts.sorted(by: postSortByDistance)
        
        return result
    }
    
    func postSortByDistance(_ post1: Post, _ post2: Post) -> Bool
    {
        let current = CLLocation(latitude: Coordinates.CurrentLocation.latitude, longitude: Coordinates.CurrentLocation.longitude)
        let loc1 = CLLocation(latitude: post1.location.latitude, longitude: post1.location.longitude)
        let loc2 = CLLocation(latitude: post2.location.latitude, longitude: post2.location.longitude)
        
        return loc1.distance(from: current) > loc2.distance(from: current)
    }
}
