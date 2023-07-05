
import XCTest
@testable import Fetch___iOS_Coding_Challenge

class NetworkingManagerTests: XCTestCase {
    
    var networkManager: NetworkingManager!
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkingManager.shared
    }
    
    override func tearDown() {
        super.tearDown()
        networkManager = nil
    }

    func testNetworkingManagerBadURL() async {
        
        do {
            _ = try await networkManager.getRequest(withEndpoint: "")
        }
        catch {
            XCTAssertEqual(error as? Errors, Errors.invalidURL)
        }
    }
    
    func testNetworkingManagerRequestFailed() async {
        
        do {
            _ = try await networkManager.getRequest(withEndpoint: "\(Environments.baseURL.rawValue)invalidURLTest")
        }
        catch {
            XCTAssertEqual(error as? Errors, Errors.requestFailed)
        }
    }
    
    func testNetworkingManager() async {
                
        let data = try? await networkManager.getRequest(withEndpoint: "\(Environments.baseURL.rawValue)\(APIEndpoints.dessertList.rawValue)")
        XCTAssertNotNil(data)
        
    }


}
