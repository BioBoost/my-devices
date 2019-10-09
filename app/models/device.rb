class Device < ApplicationRecord
  belongs_to :device, optional: true
end
