//
//  Endpoint_ComicTests.swift
//  Marvel ComicsTests
//
//  Created by Marlow Charite on 11/9/22.
//

@testable import Marvel_Comics
import XCTest

final class Endpoint_ComicTests: XCTestCase {
    
    private let mockURL = URL(string: "https://marvel-comics.test.com")!
    private let fakeAPIKey = "23r8dfhodfd9o"
    private let fakePrivateAPIKey = "23r8dfhodfd9o"

    func testComics_returnsCorrectURL() {
        let sut = Endpoint.comics()
            .request(with: fakeAPIKey, privateKey: fakePrivateAPIKey, baseUrl: mockURL)
        
        let url = sut?.url?.absoluteString ?? ""
        
        XCTAssert(url.contains("https://marvel-comics.test.com/v1/public/comics?apikey=23r8dfhodfd9o"))
    }
    
    func testComic_withId_returnsCorrectURL() {
        let sut = Endpoint.comic(for: 14)
            .request(with: fakeAPIKey, privateKey: fakePrivateAPIKey, baseUrl: mockURL)
        
        let url = sut?.url?.absoluteString ?? ""

        XCTAssert(url.contains("https://marvel-comics.test.com/v1/public/comics/14?apikey=23r8dfhodfd9o"))

    }
}
