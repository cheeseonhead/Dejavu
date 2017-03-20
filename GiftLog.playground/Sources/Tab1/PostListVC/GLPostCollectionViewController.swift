import UIKit

class GLPostCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    required init()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        super.init(collectionViewLayout: layout)
        
        collectionView?.backgroundColor = UIColor.white
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let viewPostViewController = ViewPostViewController(nibName: nil, bundle: nil)
        viewPostViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewPostViewController, animated: true)
    }
    
    func addButtonPressed()
    {
        let addPostViewController = AddPostNavigationController(nibName: nil, bundle: nil)
        present(addPostViewController, animated: true, completion: nil)
//        navigationController?.pushViewController(addPostViewController, animated: true)
    }
}
