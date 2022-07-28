//
//  HomePresenterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//
import Foundation

final class HomePresenterImpl: HomePresenter {

    weak var view: HomeViewFromPresenter?
    
    var interactor: HomeInteractorInput?
    
    var router: HomeRouter?
    
    func viewDidLoad() {
        
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        print(indexPath.row)
        router?.goToCamera(view: view)
    }
    
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType? {
        interactor?.cellType(cellForRowAt: indexPath)
    }
    
    func numberCells() -> Int? {
        interactor?.getNumberCells()
    }
    
}

extension HomePresenterImpl: HomeInteractorOutput {
    func onError(errorMessage: String) {

    }
}

extension HomePresenterImpl: HomePresenterToRouter {
    func didSelectButtonChart() {
        router?.goToChart()
    }
    
}
