class Device < ApplicationRecord
  belongs_to :user, optional: true

  validates :mac, format: { with: /\A([0-9A-Fa-f]{1,2}[-:]){5}([0-9A-Fa-f]{1,2})\z/ },
    presence: true, uniqueness: true

  before_save :downcase_mac
  after_validation :expand_mac

  private
  def downcase_mac
    self.mac.downcase!
  end

  private
  def expand_mac
    self.mac = ApplicationController.helpers.expand_mac(self.mac)
  end
end
