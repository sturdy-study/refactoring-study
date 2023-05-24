module InvoiceView
  SPACE = '  '
  PENNY_COST = 100

  def invoice_result_view(view_hash)
    view = "청구 내역 (고객명: #{view_hash[:customer]})\n"
    view += generate_invoice_history_view(view_hash[:invoice_histories])

    total_cost_dollar = penny_to_dollar(view_hash[:total_cost])
    view += "총액: #{dollar_view(total_cost_dollar)}\n"
    view += "적립 포인트: #{view_hash[:total_points]}점\n"

    view
  end

  private

  def penny_to_dollar(penny)
    (penny / PENNY_COST).to_f
  end

  def dollar_view(dollar)
    "$#{'%.2f' % dollar}"
  end

  private

  def generate_invoice_history_view(invoice_histories)
    view = ''
    invoice_histories.each do |invoice_history|
      cost_dollar = penny_to_dollar(invoice_history[:cost])
      view += "#{SPACE}#{invoice_history[:name]}: #{dollar_view(cost_dollar)} (#{invoice_history[:seats]}석)\n"
    end

    view
  end
end