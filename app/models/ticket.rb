class Ticket < ActiveRecord::Base
	before_create :set_access_token
  belongs_to :user

  private

  def set_access_token
    self.access_token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless Ticket.where(access_token: token).exists?
    end
  end
end
