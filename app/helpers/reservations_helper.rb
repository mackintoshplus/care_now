module ReservationsHelper
  def generate_barcode
    require 'barby'
    require 'barby/barcode/ean_13'
    require 'barby/outputter/png_outputter'

    # ユニークな12桁の番号を生成します。
    unique_number = generate_unique_number_for_user

    ean = Barby::EAN13.new(unique_number)

    # バーコードをBase64でエンコードします。
    barcode_png = Barby::PngOutputter.new(ean).to_png(xdim: 1)
    "data:image/png;base64,#{Base64.encode64(barcode_png)}"
  end

  def generate_unique_number_for_user
    loop do
      random_number = rand(1_000_000_000_000..9_999_999_999_999).to_s[0, 12]
      # usersテーブルにすでにその番号が存在しないことを確認します。
      unless User.exists?(barcode_number: random_number)
        return random_number
      end
    end
  end
end
