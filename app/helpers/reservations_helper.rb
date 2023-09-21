module ReservationsHelper
  def generate_barcode_for_user(user)
    puts "Debug: User ID - #{user.id}, Barcode - #{user.barcode_number}"
    require 'barby'
    require 'barby/barcode/ean_13'
    require 'barby/outputter/png_outputter'

    # 最後の1桁（チェックディジット）を除いた12桁の数字を取得
    ean_number_without_check_digit = user.barcode_number[0..-2]

    ean = Barby::EAN13.new(ean_number_without_check_digit)

    barcode_png = Barby::PngOutputter.new(ean).to_png(xdim: 1)
    "data:image/png;base64,#{Base64.encode64(barcode_png)}"
  end
end
