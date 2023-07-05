//
//  ViewController.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import UIKit

class MealListViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let viewModel: MealListViewModel?
    
    init(viewModel: MealListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(ErrorStrings.coderNotImplemented.rawValue)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        Task {
            await fetchDessertMealsAsync()
        }
    }
    
    private func setupUI() {
        title = "\(Headings.dessertRecipes.rawValue)"
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        // Configure Collection View
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MealCollectionViewCell.self, forCellWithReuseIdentifier: "\(ReusableIdentifiers.mealCollectionViewCell.rawValue)")
        collectionView.register(EmptyCollectionViewCell.self, forCellWithReuseIdentifier: "\(ReusableIdentifiers.emptyCollectionViewCell.rawValue)")
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        // Add Collection View view to the view hierarchy
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
    private func fetchDessertMealsAsync() async {
        
        view.showActivityIndicator()
        try? await viewModel?.fetchDessertMealsAsync()
        
        await MainActor.run(body: {
            view.hideActivityIndicator()
            collectionView.reloadData()
        })
    }
}

extension MealListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = viewModel?.items?.count,
           count != 0 {
            return count
        }
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard viewModel?.items?.count != 0 else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ReusableIdentifiers.emptyCollectionViewCell.rawValue)", for: indexPath) as? EmptyCollectionViewCell ?? EmptyCollectionViewCell()
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ReusableIdentifiers.mealCollectionViewCell.rawValue)", for: indexPath) as? MealCollectionViewCell ?? MealCollectionViewCell()
        if let mealItems = viewModel?.items {
            cell.configure(with: mealItems[indexPath.row])
        }
        
        return cell
    }
}

extension MealListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if  let mealItems = viewModel?.items,
            mealItems.count > 0,
            let name = mealItems[indexPath.row].name,
            let mealId = mealItems[indexPath.row].id {
            
            let mealDetailViewModel = MealIngredientsViewModel(mealId: mealId, name: name)
            let mealDetailViewController = MealIngredientsViewController(viewModel: mealDetailViewModel)
            navigationController?.pushViewController(mealDetailViewController, animated: true)
        }
        else {
            Task {
                await fetchDessertMealsAsync()
            }
        }
        
        
    }
}

extension MealListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard viewModel?.items?.count != 0 else {
            return CGSize(width: view.frame.width, height: view.frame.height/1.25)
        }
        
        let width = view.frame.width/Constants.recipieCollectionViewWidthDivider
        return CGSize(width: width, height: width + Constants.cellTitleHeight)
    }
    
    
    
}

