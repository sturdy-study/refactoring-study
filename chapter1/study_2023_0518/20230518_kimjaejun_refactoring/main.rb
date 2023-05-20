require 'json'

module Play
  module Type
    TRAGEDY = "tragedy"
    COMEDY = "comedy"
  end
end

module Fee
  module Tragedy
    BASIC = 40000
  end

  module Comedy
    BASIC = 30000
  end
end

def statement(invoice, plays)
  total_statement_amount = 0
  point_amount = 0
  billing_histories = []

  invoice[:performances].each do |performance|
    play_id = performance[:playID].to_sym
    play = plays[play_id]

    # 금액 계산
    play_admission_fee = calculate_admission_fee(performance, play)

    # 포인트 적립
    point_amount += accumulate_points(performance, play)

    # 청구 내역을 출력한다.
    billing_histories << billing_history_view(performance, play, play_admission_fee)

    total_statement_amount += play_admission_fee
  end

  result_view(total_statement_amount, point_amount, invoice, billing_histories)
end

def accumulate_points(performance, play)
  # 포인트 적립
  this_point_amount = performance[:audience] - 30 if performance[:audience] - 30 > 0
  # 희극 관객 5명마다 추가 포인트를 제공한다.
  this_additional_point = (performance[:audience] / 5).floor(2) if "comedy" == play[:type]

  this_point_amount.to_i + this_additional_point.to_i
end

def calculate_admission_fee(performance, play)
  case play[:type]
  when Play::Type::TRAGEDY
    admission_fee = Fee::Tragedy::BASIC
    admission_fee += 1000 * (performance[:audience] - 30) if performance[:audience] > 30
  when Play::Type::COMEDY
    admission_fee = Fee::Comedy::BASIC + (300 * performance[:audience])
    admission_fee += 10000 + 500 * (performance[:audience] - 20) if performance[:audience] > 20
  else
    raise "알 수 없는 장르: #{play[:type]}"
  end

  admission_fee
end

def result_view(total_statement_amount, point_amount, invoice, billing_histories)
  result = "청구 내역 (고객명: #{invoice[:customer]})\n"

  # 청구 내역 리스트
  result += billing_histories.map { |billing_history| "  #{billing_history}\n" }.join

  result += "총액: $#{'%.2f' % won_to_dollar(total_statement_amount)}\n"
  result += "적립 포인트: #{point_amount}점\n"

  result
end

def billing_history_view(performance, play, play_admission_fee)
  # 청구 내역을 출력한다.
  "#{play[:name]}: $#{'%.2f' % won_to_dollar(play_admission_fee)} (#{performance[:audience]}석)"
end

def won_to_dollar(money)
  (money / 100).to_f
end

# data
invoices = JSON.parse(File.read('./invoices.json'), symbolize_names: true)
plays = JSON.parse(File.read('./plays.json'), symbolize_names: true)

invoices.each do |invoice|
  puts statement invoice, plays
end
