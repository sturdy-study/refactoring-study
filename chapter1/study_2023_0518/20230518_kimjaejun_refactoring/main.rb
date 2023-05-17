require 'json'

def statement(invoice, plays)
  total_amount = 0
  volume_credits = 0
  result = "청구 내역 (고객명: #{invoice["customer"]})\n"

  invoice["performances"].each do |perf|
    play = plays[perf["playID"]]

    # 금액 계산
    this_amount = calculate_amount(perf, play)

    # 포인트 적립
    volume_credits += accumulate_credit(perf, play, volume_credits)

    # 청구 내역을 출력한다.
    result += "  #{play["name"]}: $#{'%.2f' % (this_amount / 100)} (#{perf["audience"]}석)\n"
    total_amount += this_amount
  end

  result += "총액: $#{'%.2f' % (total_amount / 100)}\n"
  result += "적립 포인트: #{volume_credits}점\n"

  result
end

def accumulate_credit(perf, play, volume_credits)
  volume_credits += [perf["audience"] - 30, 0].max
  # 희극 관객 5명마다 추가 포인트를 제공한다.
  volume_credits += (perf["audience"] / 5).floor(2) if "comedy" == play["type"]

  volume_credits
end

def calculate_amount(perf, play)
  this_amount = 0

  case play["type"]
  when "tragedy"
    this_amount = 40000
    if perf["audience"] > 30
      this_amount += 1000 * (perf["audience"] - 30)
    end
  when "comedy"
    this_amount = 30000
    if perf["audience"] > 20
      this_amount += 10000 + 500 * (perf["audience"] - 20)
    end
    this_amount += 300 * perf["audience"]
  else
    raise "알 수 없는 장르: #{play["type"]}"
  end

  this_amount
end


# data
invoices = JSON.parse(File.read('./invoices.json'))
plays = JSON.parse(File.read('./plays.json'))

invoices.each do |invoice|
  puts statement invoice, plays
end
