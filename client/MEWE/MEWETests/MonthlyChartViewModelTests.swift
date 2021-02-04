//
//  MonthlyChartViewModelTests.swift
//  MEWETests
//
//  Created by Keunna Lee on 2021/02/04.
//

import XCTest
@testable import MEWE

class MonthlyChartViewModelTests: XCTestCase {

    // Test succeeded
    func testUpdateChartData() {
        // given
        let viewModel = MonthlyChartViewModel()
        // when
        let originalData = viewModel.pieChartdata
        viewModel.updateChartData()
        let shuffledData = viewModel.pieChartdata
        // then
        XCTAssertNotEqual(originalData, shuffledData, "차트에 들어갈 데이터 배열의 순서가 셔플되었습니다.")
    }
    
    // Test succeeded
    func testUpdateToPreviousMonth() {
        // given
        let viewModel = MonthlyChartViewModel()
        viewModel.currentMonth = 4
        viewModel.currentYear = 2021
          // expacted value
        let march = 3
        let yearToMove = 2021
        // when
        viewModel.updateToPreviousMonth()
        // then
        XCTAssertEqual(viewModel.currentMonth, march, "viewModel의 currentMonth가 4월의 1달 전인 3월로 업데이트 되었습니다.")
        XCTAssertEqual(viewModel.currentYear, yearToMove, "viewModel의 currentYear가 2021년으로 유지되었습니다.")
    }
    
    // Test succeeded
    func testUpdateToPreviousMonthInJanuary() {
        // given
        let viewModel = MonthlyChartViewModel()
        viewModel.currentMonth = 1
        viewModel.currentYear = 2021
          // expacted value
        let december = 12
        let previousYear = 2020
        // when
        viewModel.updateToPreviousMonth()
        // then
        XCTAssertEqual(viewModel.currentMonth, december, "viewModel의 currentMonth가 1월의 1달 전인 12월로 업데이트 되었습니다.")
        XCTAssertEqual(viewModel.currentYear, previousYear, "viewModel의 currentYear가 2021년의 전년인 2020년으로 업데이트 되었습니다.")
    }
    
    // Test succeeded
    func testUpdateToNextMonth() {
        // given
        let viewModel = MonthlyChartViewModel()
        viewModel.currentMonth = 7
        viewModel.currentYear = 2021
          // expacted value
        let august = 8
        let yearToMove = 2021
        // when
        viewModel.updateToNextMonth()
        // then
        XCTAssertEqual(viewModel.currentMonth, august, "viewModel의 currentMonth가 7월의 1달 후인 8월로 업데이트 되었습니다.")
        XCTAssertEqual(viewModel.currentYear, yearToMove, "viewModel의 currentYear가 2021년으로 유지되었습니다.")
    }
    
    func testUpdateToNextMonthInDecember() {
        // given
        let viewModel = MonthlyChartViewModel()
        viewModel.currentMonth = 12
        viewModel.currentYear = 2021
          // expacted value
        let january = 1
        let nextYear = 2022
        // when
        viewModel.updateToNextMonth()
        // then
        XCTAssertEqual(viewModel.currentMonth, january, "viewModel의 currentMonth가 12월의 1달 후인 1월로 업데이트 되었습니다.")
        XCTAssertEqual(viewModel.currentYear, nextYear, "viewModel의 currentYear가 2021년의 다음 년도인 2022년으로 업데이트 되었습니다.")
    }

}
