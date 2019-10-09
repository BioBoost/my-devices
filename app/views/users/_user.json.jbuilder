json.extract! user, :id, :name
json.devices do
  json.array! @user.devices, partial: 'devices/device', as: :device
end
json.url user_url(user, format: :json)
