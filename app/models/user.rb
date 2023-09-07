class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations

  before_create :assign_barcode_number

  private

  def assign_barcode_number
    self.barcode_number = generate_unique_number_for_user
  end

  def generate_unique_number_for_user
    loop do
      random_number = rand(1_000_000_000_000..9_999_999_999_999).to_s[0, 12]
      unless User.exists?(barcode_number: random_number)
        return random_number
      end
    end
  end
end
