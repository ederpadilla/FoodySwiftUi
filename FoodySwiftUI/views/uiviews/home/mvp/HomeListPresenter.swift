import Foundation

/*class HomeListPresenter: ObservableObject {
 
 @Published var homeListState: HomeListState = .showLoading
 
 private var foodys = [Foody]()
 private var selectedFoody = Foody()
 
 func fetchFoodys() {
 
 self.homeListState = .showLoading
 Task {
 do {
 handleFetchFoodysSuccess(try await NetworkManager.shared.fetchFoodys())
 } catch {
 handleFetchFoodysError(error)
 }
 }
 }
 
 private func handleFetchFoodysSuccess(_ foodys: [Foody]) {
 self.foodys = foodys
 hideLoading()
 showFoodys(foodys: foodys.asFoodyListItemUI())
 }
 
 private func handleFetchFoodysError(_ error: Error?) {
 if let error = error as? FoodyError {
 showAlertItem(alertItem: getErrorAlert(error))
 }
 
 }
 
 func showFoodys(foodys: [FoodyListItemUI]) {
 self.homeListState = .showFoodys(foodys: foodys)
 }
 
 func showLoading() {
 self.homeListState = .showLoading
 }
 
 func hideLoading() {
 self.homeListState = .hideLoading
 }
 
 func showAlertItem(alertItem: AlertItem) {
 self.homeListState = .showAlertItem(alertItem: alertItem)
 }
 
 func hideAlertItem() {
 self.homeListState = .hideAlertItem
 }
 
 func openDetailView(selectedFoody: Foody) {
 self.homeListState = .openDetailView(selectedFoody: selectedFoody)
 }
 
 func hideDetailView() {
 self.homeListState = .hideDetailView
 }
 
 private func getErrorAlert(_ error: FoodyError) -> AlertItem {
 switch error {
 case .invalidURL:
 return AlertContext.invalidURL
 case .invalidResponse:
 return AlertContext.invalidResponse
 case .invalidData:
 return AlertContext.invalidData
 case .noInternet:
 return AlertContext.noInternet
 default:
 return AlertContext.unknown
 }
 }
 
 func selectFoody(_ foodyListItemUI: FoodyListItemUI) {
 if let selectedFoody = foodys.first(where: {  $0.id == foodyListItemUI.id }) {
 self.selectedFoody = selectedFoody
 openDetailView(selectedFoody: selectedFoody)
 }
 }
 
 enum HomeListState {
 case showFoodys(foodys: [FoodyListItemUI])
 case showLoading
 case hideLoading
 case showAlertItem(alertItem: AlertItem)
 case hideAlertItem
 case openDetailView(selectedFoody: Foody)
 case hideDetailView
 }
 }
 
 protocol HomeListUI: AnyObject {
 func showFoodys(foodys: [FoodyListItemUI])
 func showLoading()
 func hideLoading()
 func showAlertItem(alertItem: AlertItem)
 func hideAlertItem()
 func openDetailView(selectedFoody: Foody)
 func hideDetailView()
 }*/

protocol HomePresenterProtocol: AnyObject {
    func fetchFoodys()
    func selectFoody(_ foodyListItemUI: FoodyListItemUI)
}

protocol HomePresenterDelegate: AnyObject {
    func showFoodys(foodys: [FoodyListItemUI])
    func showLoading()
    func showAlertItem(alertItem: AlertItem)
    func openDetailView(selectedFoody: Foody)
}

class HomePresenter: HomePresenterProtocol {
    private var service: HomePresenterProtocol
    private weak var delegate: HomePresenterDelegate?
    private var foodys = [Foody]()
    private var selectedFoody = Foody()
    
    init(service: HomePresenterProtocol, delegate: HomePresenterDelegate?) {
        self.service = service
        self.delegate = delegate
    }
    
    func fetchFoodys() {
        Task {
            do {
                handleFetchFoodysSuccess(try await NetworkManager.shared.fetchFoodys())
            } catch {
                handleFetchFoodysError(error)
            }
        }
    }
    
    private func handleFetchFoodysSuccess(_ foodys: [Foody]) {
        self.foodys = foodys
        delegate?.showFoodys(foodys: foodys.asFoodyListItemUI())
    }
    
    private func handleFetchFoodysError(_ error: Error?) {
        if let error = error as? FoodyError {
            delegate?.showAlertItem(alertItem: getErrorAlert(error))
        }
    }
    
    private func getErrorAlert(_ error: FoodyError) -> AlertItem {
        switch error {
        case .invalidURL:
            return AlertContext.invalidURL
        case .invalidResponse:
            return AlertContext.invalidResponse
        case .invalidData:
            return AlertContext.invalidData
        case .noInternet:
            return AlertContext.noInternet
        default:
            return AlertContext.unknown
        }
    }
    
    func selectFoody(_ foodyListItemUI: FoodyListItemUI) {
        if let selectedFoody = foodys.first(where: {  $0.id == foodyListItemUI.id }) {
            self.selectedFoody = selectedFoody
            delegate?.openDetailView(selectedFoody: selectedFoody)
        }
    }
}

class HomeStore: ObservableObject {
    
    enum State {
        case showFoodys(foodys: [FoodyListItemUI])
        case showLoading
        case showAlertItem(alertItem: AlertItem)
        case openDetailView(selectedFoody: Foody)
    }
    
    @Published var state: State = .showLoading
}

extension HomeStore: HomePresenterDelegate {
    
    func showFoodys(foodys: [FoodyListItemUI]) {
        state = .showFoodys(foodys: foodys)
    }
    
    func showLoading() {
        state = .showLoading
    }
    
    func showAlertItem(alertItem: AlertItem) {
        state = .showAlertItem(alertItem: alertItem)
    }
    
    func openDetailView(selectedFoody: Foody) {
        state = .openDetailView(selectedFoody: selectedFoody)
    }
}

