//
//  RecipeIngredientsViewController.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import Foundation
import UIKit

class MealIngredientsViewController: UIViewController {
    
    // MARK: - Properties
    
    var mealId: String?
    private var viewModel: MealIngredientsViewModel?
    
    
    private let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Constants.cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var viewsToDisplay: [UIView] = []
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.title = viewModel?.name

        Task {
            await fetchMealDetails()
        }
    }
    
    init(viewModel: MealIngredientsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(ErrorStrings.coderNotImplemented.rawValue)")
    }
        
    private func configureUI() {
        guard let viewModel,
              let mealDetails = viewModel.mealDetails else {
            
            //Handle Null Case
            return
        }
        
        if let thumbnail = mealDetails.image,
           let url = URL(string: thumbnail) {
            mealImageView.loadImage(from: url)
        }
        
        if let ingredients = viewModel.ingredients {
            let ingredientsDetailsView = DetailsSectionView(title: "\(Headings.ingredients.rawValue)", description: ingredients)
            ingredientsDetailsView.translatesAutoresizingMaskIntoConstraints = false
            viewsToDisplay.append(ingredientsDetailsView)
        }
        
        if let instructions = mealDetails.instructions {
            let instructionDetailsView = DetailsSectionView(title: "\(Headings.instructions.rawValue)", description: instructions)
            instructionDetailsView.translatesAutoresizingMaskIntoConstraints = false
            viewsToDisplay.append(instructionDetailsView)
        }
        
        if let category = mealDetails.category {
            let categoryDetailsView = DetailsSectionView(title: "\(Headings.category.rawValue)", description: category)
            categoryDetailsView.translatesAutoresizingMaskIntoConstraints = false
            viewsToDisplay.append(categoryDetailsView)
        }
        
        if let area = mealDetails.area {
            let areaDetailsView = DetailsSectionView(title: "\(Headings.area.rawValue)", description: area)
            areaDetailsView.translatesAutoresizingMaskIntoConstraints = false
            viewsToDisplay.append(areaDetailsView)
        }
        
        if let drinkAlternate = mealDetails.drinkAlternate {
            let drinkAlternateView = DetailsSectionView(title: "\(Headings.drinkAlternate.rawValue)", description: drinkAlternate)
            drinkAlternateView.translatesAutoresizingMaskIntoConstraints = false
            viewsToDisplay.append(drinkAlternateView)
        }
        
        if let tags = mealDetails.tags {
            let tagsView = DetailsSectionView(title: "\(Headings.tags.rawValue)", description: tags)
            tagsView.translatesAutoresizingMaskIntoConstraints = false
            viewsToDisplay.append(tagsView)
        }
        
        if let source = mealDetails.source,
           let sourceURL = URL(string: source){
            
            let string = source
            let attributedLinkString = NSMutableAttributedString(string: string, attributes:[NSAttributedString.Key.link: sourceURL])
            
            let sourceView = DetailsSectionView(title: "\(Headings.source.rawValue)", descriptionAttributedText: attributedLinkString, url: sourceURL)
            sourceView.translatesAutoresizingMaskIntoConstraints = false
            viewsToDisplay.append(sourceView)
        }
        
        if let youtube = mealDetails.youtube,
           let youtubeURL = URL(string: youtube+"\(General.inlineYoutube.rawValue)") {
            
            let headingView = HeadingView(title: "\(Headings.youtube.rawValue)")
            headingView.translatesAutoresizingMaskIntoConstraints = false
            viewsToDisplay.append(headingView)
            
            let youtubeView = WebPlayerView(url: youtubeURL)
            youtubeView.translatesAutoresizingMaskIntoConstraints = false
            viewsToDisplay.append(youtubeView)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.setupConstraints()
        }
    }
    
    
    // MARK: - Fetch Meal Details
    
    private func fetchMealDetails() async {
        
        view.showActivityIndicator()
        do {
            try await viewModel?.fetchMealDetails()
        }
        catch {
            debugPrint(error)
        }
        
        await MainActor.run(body: {
            view.hideActivityIndicator()
            configureUI()
        })
    }
        
// MARK: - Constraints Setup

    private func setupConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mealImageView)
        
        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            mealImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.topConstraint),
            mealImageView.widthAnchor.constraint(equalToConstant: Constants.ingredientsImageViewWidth),
            mealImageView.heightAnchor.constraint(equalToConstant: Constants.ingredientsImageViewHeight),
            mealImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])
        
        for (index, detailView) in viewsToDisplay.enumerated() {
            contentView.addSubview(detailView)
            
            NSLayoutConstraint.activate([
                detailView.topAnchor.constraint(equalTo: index == 0 ? mealImageView.bottomAnchor : viewsToDisplay[index-1].bottomAnchor, constant: Constants.topConstraint),
                detailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leadingConstraint),
                detailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.trailingConstraint)
            ])
        }
        if viewsToDisplay.count > 0 {
            NSLayoutConstraint.activate([
                viewsToDisplay[viewsToDisplay.count-1].bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        }
        
    }
}
