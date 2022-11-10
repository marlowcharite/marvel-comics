//
//  LibraryViewModelTests.swift
//  Marvel ComicsTests
//
//  Created by Marlow Charite on 11/9/22.
//

@testable import Marvel_Comics
import XCTest

final class LibraryViewModelTests: XCTestCase {
    
    private var sut: LibraryViewModel!
    private var repository: MockComicsRepository!
    
    override func setUp() {
        super.setUp()
        repository = MockComicsRepository()
        sut = LibraryViewModel(repository: repository)
    }
    
    func testComics_updatesComics_onSuccess() async {
        XCTAssert(sut.comics.isEmpty)
        
        await sut.loadComics()
        
        XCTAssertEqual(sut.comics.count, 5)
    }

    func testComics_updatesErrorMessage_onFailure() async {
        repository.shouldError = true
        XCTAssertNil(sut.errorMessage)
        
        await sut.loadComics()
        
        XCTAssertNotNil(sut.errorMessage)
    }

    // MARK: - Support
    
    final class MockComicsRepository: ComicsRepository {
        
        enum MockError: Error {
            case fail
        }
        
        var shouldError = false
        
        func retrieveAllComics() async throws -> [ComicEntity] {
            guard !shouldError else {
                throw MockError.fail
            }
            
            return [
                ComicEntity(id: 3, title: "Spiderman", date: Date(), coverImagePath: "", coverImageExtension: "", description: "Amazing"),
                ComicEntity(id: 3, title: "Punisher", date: Date(), coverImagePath: "", coverImageExtension: "", description: "Vengeance"),
                ComicEntity(id: 3, title: "Black Panther", date: Date(), coverImagePath: "", coverImageExtension: "", description: "Royalty"),
                ComicEntity(id: 3, title: "Storm", date: Date(), coverImagePath: "", coverImageExtension: "", description: "Powerful"),
                ComicEntity(id: 3, title: "Ironman", date: Date(), coverImagePath: "", coverImageExtension: "", description: "Rich")
            ]
        }
        
        func retrieveComic(with id: Int) async throws -> ComicEntity {
            ComicEntity(id: 3, title: "Spiderman", date: Date(), coverImagePath: "", coverImageExtension: "", description: "Amazing")
        }
    }
}
