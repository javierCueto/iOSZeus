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
    
    var title: String? {
        interactor?.title
    }
    
    func viewDidLoad() {
        
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        interactor?.goToModule(indexPath: indexPath)
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
        view?.showError(errorMessage: errorMessage)
    }
    
    func goToCameraModule() {
        router?.goToCamera(view: view, parentPresenter: self)
    }
    
    func goToChartModule() {
        router?.goToChart(view: view)
    }
}

extension HomePresenterImpl: HomePresenterToRouter {
    func didSelectButtonChart() {
        router?.goToChart(view: view)
    }
    
}

extension HomePresenterImpl: CameraPresenterDelegate {
    func imageTaken(image: Any) {
        dump(image)
    }

}


