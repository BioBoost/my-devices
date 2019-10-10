class UpdatesController < ApplicationController

  skip_before_action :verify_authenticity_token

  # POST /updates
  # POST /updates.json
  def create
    respond_to do |format|
      if (request.format == 'json')
        @device = Device.find_or_create_by(mac: helpers.expand_mac(update_params['mac'].downcase))
        @device.ip = update_params['ip']
        @device.last_seen = DateTime.now
        puts update_params
        @device.name = (update_params.key?('name') ? update_params['name'] : @device.name)
        if @device.save
          format.json { render 'devices/show', status: :ok }
        else
          format.json { render json: @device.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def update_params
      params.require(:update).permit(:mac, :ip, :name)
    end
end
