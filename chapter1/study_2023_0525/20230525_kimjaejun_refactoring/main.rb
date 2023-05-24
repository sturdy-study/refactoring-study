require 'json'
require_relative './play'
require_relative './cost'
require_relative './invoice_view'

include InvoiceView

def statement(invoice, plays)
  total_amount = 0
  invoice_histories = []
  result_view_hash = { customer: invoice[:customer] }

  invoice[:performances].each do |perf|
    play = plays[perf[:playID].to_sym]

    # 연극 관람료 계산 (단위는 penny)
    play_cost = get_play_cost(play, perf)

    # 출력할 청구내역 정보 저장
    invoice_histories << { name: play[:name], cost: play_cost.to_f, seats: perf[:audience] }
    total_amount += play_cost
  end

  # 포인트는 따로 총 적립
  total_points = get_total_points(invoice[:performances], plays)

  result_view_hash[:invoice_histories] = invoice_histories
  result_view_hash[:total_cost] = total_amount.to_f
  result_view_hash[:total_points] = total_points

  invoice_result_view(result_view_hash)
end

private

def get_total_points(performances, plays)
  points = 0
  performances.each do |performance|
    play = plays[performance[:playID].to_sym]
    points += if play[:type] == Play::Type::COMEDY
                [performance[:audience] - 30, 0].max + (performance[:audience] / 5).floor(2)
              else
                [performance[:audience] - 30, 0].max
              end
  end

  points
end

def get_play_cost(play, performance)
  case play[:type]
  when Play::Type::TRAGEDY
    get_tragedy_cost(performance)
  when Play::Type::COMEDY
    get_comedy_cost(performance)
  else
    raise "알 수 없는 장르: #{play[:type]}"
  end
end

def get_tragedy_cost(performance)
  performance[:audience] <= 30 ? Cost::Tragedy::BASIC : Cost::Tragedy::BASIC + 1000 * (performance[:audience] - 30)
end

def get_comedy_cost(performance)
  additional_common_cost = 300 * performance[:audience]
  if performance[:audience] > 20
    additional_common_cost + Cost::Comedy::BASIC + 10000 + 500 * (performance[:audience] - 20)
  else
    additional_common_cost + Cost::Comedy::BASIC
  end
end

# data
invoices = JSON.parse(File.read('./invoices.json'), symbolize_names: true)
plays = JSON.parse(File.read('./plays.json'), symbolize_names: true)

invoices.each do |invoice|
  puts statement invoice, plays
end
