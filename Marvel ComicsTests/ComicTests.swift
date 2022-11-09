//
//  ComicTests.swift
//  Marvel ComicsTests
//
//  Created by Marlow Charite on 11/9/22.
//

@testable import Marvel_Comics
import XCTest

final class ComicTests: XCTestCase {
    
    private let testBundle = Bundle(for: ComicTests.self)
    private lazy var decoder: JSONDecoder = {
        let _decoder = JSONDecoder()
        _decoder.dateDecodingStrategy = .iso8601
        return _decoder
    }()

    func testComic_canDecodeListOfComicsCorrectly() {
        guard let jsonSamplePath = testBundle.url(forResource: "comics_sample", withExtension: "json"),
              let data = try? Data(contentsOf: jsonSamplePath) else {
            XCTFail("Unable to load sample json")
            return
        }
                
        let sut = try? decoder.decode([Comic].self, from: data)
        XCTAssertEqual(sut?.count, 3)
        
        let comic = sut?.first
        XCTAssertEqual(comic?.id, 82967)
        
        let lastComic = sut?.last
        XCTAssertEqual(lastComic?.id, 82970)
    }
    
    func testComic_canDecodeNestedImageTypeWithCustomKey() {
        let json =
        """
        {
            "id": 12,
            "thumbnail": {
                "path": "some_test_path",
                "extension": "jpg"
            }
        }
        """.utf8
        
        let sut = try? decoder.decode(Comic.self, from: Data(json))
        let thumbnail = sut?.thumbnail
        XCTAssertEqual(thumbnail?._extension, "jpg")
    }
    
}
