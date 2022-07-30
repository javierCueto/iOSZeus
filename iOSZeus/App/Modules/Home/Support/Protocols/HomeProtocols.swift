//
//  HomeProtocols.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

protocol HomeViewFromPresenter: AnyObject {
    var presenter: HomePresenteInput? { get }
    func showError(errorMessage: String)
    func setColor(_ color: String)
    func clearField()
    func displaySpinner()
    func removeSpinner()
    func alertSelfie()
}

protocol HomeRouter {
    var modulesHomeFactory: ModulesHomeFactory { get }
    func goToChart(view: HomeViewFromPresenter?, backGroundColor: String?)
    func goToCamera(view: HomeViewFromPresenter?, parentPresenter: CameraPresenterDelegate)
    func gotToSeePicture(view: HomeViewFromPresenter?, _ userDataBag: UserDataBag)
}


protocol HomePresenter: AnyObject {
    var view: HomeViewFromPresenter? { get }
    var interactor: HomeInteractorInput? { get }
    var router: HomeRouter? { get }
}

protocol HomePresenteInput: AnyObject {
    var title: String? { get }
    func viewDidLoad()
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType?
    func numberCells() -> Int?
    func didSelectRowAt(indexPath: IndexPath)
    func saveColor(_ color: String)
    func saveName(_ name: String?)
    func didButtonRetakeWasPressed()
    func didButtonSeeSelfieWasPressed()
}

protocol HomeInteractorOutput: AnyObject {
    func goToCameraModule()
    func goToChartModule(backgroundColor: String?)
    func onError(errorMessage: String)
    func updateColor(_ color: String)
    func userDataLoaded()
    func showSpinner()
    func hideSpinner()
    func showAlertSelfie()
}

protocol HomeInteractorInput: AnyObject {
    var presenter: HomeInteractorOutput? { get }
    var title: String? { get }
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType
    func getNumberCells() -> Int
    func goToModule(indexPath: IndexPath)
    func getDataUser()
    func persistenColor(_ color: String)
    func persistenName(_ name: String?)
    func persistenImage(_ image: Any)
    func userDataBag() -> UserDataBag
}

