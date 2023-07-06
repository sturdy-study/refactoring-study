import Foundation


struct Invoice {
    let customer: String
    let performances: [Performance]

    init(customer: String, performances: [Performance]) {
        self.customer = customer
        self.performances = performances
    }
}

struct Performance {
    let playID: String
    let audience: Int

    init(playID: String, audience: Int) {
        self.playID = playID
        self.audience = audience
    }
}

struct Play {
    let name: String
    let type: String

    init(name: String, type: String) {
        self.name = name
        self.type = type
    }
}

enum GenreError : Error {
    case undefinedType(message: String)
}

func generateInvoices() -> [Invoice] {
    let p1 = Performance(playID: "hamlet", audience: 55)
    let p2 = Performance(playID: "as-like", audience: 35)
    let p3 = Performance(playID: "othello", audience: 40)
    let performances = [p1, p2, p3]

    let i1 = Invoice(customer: "BigCo", performances: performances)

    return [i1]
}

func generatePlays() -> [String:Play] {
    let p1 = Play(name: "Hamlet", type: "tragedy")
    let p2 = Play(name: "As You Like It", type: "comedy")
    let p3 = Play(name: "Othello", type: "tragedy")

    return [
        "hamlet": p1,
        "as-like": p2,
        "othello": p3
    ]
}

func statement(invoice: Invoice, plays: [String:Play]) -> String {
    var totalAmount = 0
    var volumeCredits = 0
    var result = String(format: "청구 내역 (고객명: %@)\n", invoice.customer)

    try! invoice.performances.forEach { perf in
        var play = plays[perf.playID]
        var thisAmount = 0

        switch play?.type {
        case "tragedy":
            thisAmount = 40000
            if perf.audience > 30 {
                thisAmount += 1000 * (perf.audience - 30)
            }
        case "comedy":
            thisAmount = 30000
            if perf.audience > 20 {
                thisAmount += 10000 + 500 * (perf.audience - 20)
            }
            thisAmount += 300 * perf.audience
        default:
            let errorMessage = String(format: "알 수 없는 장르: %@", play!.type)
            print(errorMessage)
            throw GenreError.undefinedType(message: errorMessage)
        }

        // 포인트를 적립한다.
        volumeCredits += max(perf.audience - 30, 0)
        // 희극 관객 5명마다 추가 포인트를 제공한다.
        if "comedy" == play!.type {
            volumeCredits += (perf.audience / 5)
        }

        result += String(format: "  %@: $%.2f (%d석)\n", play!.name, Float(thisAmount / 100), perf.audience)
        totalAmount += thisAmount
    }

    result += String(format: "총액: $%.2f\n", Float(totalAmount / 100))
    result += String(format: "적립 포인트: %d점\n", volumeCredits)

    return result
}


// main code
let invoices = generateInvoices()
let plays = generatePlays()

invoices.forEach { invoice in
    print(statement(invoice: invoice, plays: plays))
}