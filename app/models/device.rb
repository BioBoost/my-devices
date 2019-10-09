class Device < ApplicationRecord
  belongs_to :device, optional: true

  validates :mac, format: { with: /\A([0-9A-Fa-f]{1,2}[-:]){5}([0-9A-Fa-f]{1,2})\z/ },
    presence: true, uniqueness: true

  before_save :downcase_mac
    
  private
  def downcase_mac
    self.mac.downcase!
  end
end
