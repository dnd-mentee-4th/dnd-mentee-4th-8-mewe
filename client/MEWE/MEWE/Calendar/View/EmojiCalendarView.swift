//
//  CalendarView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/26.
//

import SwiftUI
import FSCalendar

class EmojiCalendar: UIViewController, FSCalendarDelegate{
    var calendar = FSCalendar()
    var todayDate = Date()


    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.appearance.titleDefaultColor = .black
        calendar.appearance.titleWeekendColor = .black
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesSingleUpperCase
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.todayColor = UIColor(Color.easeColor)
        calendar.backgroundColor = UIColor.white.withAlphaComponent(0)
        calendar.appearance.selectionColor = UIColor(Color.softBlue)
        calendar.scope = .week
//        calendar.appearance.eventDefaultColor = .gray
//        calendar.appearance.eventSelectionColor = .gray

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendar.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: view.frame.size.width)
        view.addSubview(calendar)
    }
}

extension EmojiCalendar {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendar.scope = .week
        
    }
    
}

struct CalendarView: View {
    var calendarController = EmojiCalendarController()
    var todayContentView = EmojiCalendarWeekView(
        today: Date(), daily: Daily(date: Date(),
        emojiImage: Image.emoji_joy,
        title: "기다리던 여행 날",
        address: "00 캠핑장",
        isSharedOn: true,
        totalReaction: "29"))
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    calendarController.showMonthMode()
                    
                }) {
                    Image("Calendar_BackButton")
                }.padding()
                .buttonStyle(backButtonStyle(isWeekMode: calendarController.isWeekMode()))
                Spacer()

            }
            calendarController
                .frame(width: 362, height: 300, alignment: .center)
            todayContentView
            
            Spacer()

        }
    }
}
struct backButtonStyle: PrimitiveButtonStyle {
    var isWeekMode: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        MyButton(configuration: configuration)
    }
    struct MyButton: View {
        let configuration: PrimitiveButtonStyle.Configuration
        var body: some View {
            return configuration.label
                .opacity(1)
        }
    }
}


struct EmojiCalendarController: UIViewControllerRepresentable {
    var calendar = EmojiCalendar()

    func makeUIViewController(context: UIViewControllerRepresentableContext<EmojiCalendarController>) -> EmojiCalendar {
        return calendar
    }

    func updateUIViewController(_ uiViewController: EmojiCalendar, context: UIViewControllerRepresentableContext<EmojiCalendarController>) {
    }

    func showMonthMode() {
        calendar.calendar.scope = .month
    }
    
    func isWeekMode() -> Bool {
        if calendar.calendar.scope == .week {
            return true
        } else {
            return false
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
        
    }
}
