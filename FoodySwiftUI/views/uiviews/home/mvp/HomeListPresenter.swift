import Foundation

class HomePresenter: ObservableObject {
    
    @Published var state: HomeState = .showLoading
    
    private var foodys = [Foody]()
    private var selectedFoody = Foody()
    
    func fetchFoodys() {
        state = .showLoading
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
        DispatchQueue.main.async {
            self.state = .showFoodys(foodys: foodys.asFoodyListItemUI())
        }
    }
    
    private func handleFetchFoodysError(_ error: Error?) {
        if let error = error as? FoodyError {
            state = .showAlertItem(alertItem: getErrorAlert(error))
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
            state = .openDetailView(selectedFoody: selectedFoody)
        }
    }
}

enum HomeState {
    case showFoodys(foodys: [FoodyListItemUI])
    case showLoading
    case showAlertItem(alertItem: AlertItem)
    case openDetailView(selectedFoody: Foody)
    case hideDetailView
}
