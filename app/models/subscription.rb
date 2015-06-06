class Subscription < ActiveRecord::Base

  YEARS = (Date.today.year ... Date.today.year + 6).to_a

  validates :name, presence: true, length: {within: 3...40}
  validates :email, presence: true, email: true, uniqueness: {case_sensitive: false, message: "is already subscribed to our mailing list. "}
  validates :year, presence: true, inclusion: YEARS

  def self.year_options
    YEARS.map do |y|
      ["MIT Class of #{y}", y]
    end
  end

end
