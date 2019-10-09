json.extract! device, :id, :name, :mac, :ip
json.owner do
  json.extract! device.user, :id, :name
  json.url user_url(device.user, format: :json)
end
json.last_seen device.last_seen
json.url device_url(device, format: :json)
