class PagesController < ApplicationController
  def index
  end

  def prepare
  end

  def about
  end

  def contact
  end

  def area
    @area = Area.find(current_lgu_officer.area_id)
    @residents = Resident.where(area_id: @area.id)
  end

  def centers
    @areas = Area.all
  end

  def responses
    @responses = LguResponse.where(lgu_officer_id: current_lgu_officer.id)
  end

  def resident_responses
    @resident_responses = ResidentLguResponse.where(lgu_response_id: params[:id])
  end

  def view
    start_date = params['start_date']
    end_date = params['end_date']
    if (start_date.present? && !end_date.present?)
      @resident_lgu_responses = ResidentLguResponse.where("created_at >= ?", start_date.to_date).where(is_safe: false)
      @date_message = start_date
    elsif (end_date.present? && !start_date.present?)
      @resident_lgu_responses = ResidentLguResponse.where("created_at >= ?", end_date.to_date).where(is_safe: false)
      @date_message = end_date
    elsif (end_date.present? && start_date.present?)
      @resident_lgu_responses = ResidentLguResponse.where("created_at >= ? AND created_at <= ?", start_date.to_date, end_date.to_date).where(is_safe: false)
      @date_message = "#{start_date} to #{end_date}"
    else
      @resident_lgu_responses = ResidentLguResponse.where("created_at >= ?", Time.zone.now.beginning_of_day).where(is_safe: false)
      @date_message = Date.today
    end
    @hash = Gmaps4rails.build_markers(@resident_lgu_responses) do |resident_lgu_response, marker|
      marker.lat resident_lgu_response.latitude
      marker.lng resident_lgu_response.longitude
       marker.infowindow "Location: #{resident_lgu_response.address}<br>Longitude: #{resident_lgu_response.longitude}<br>Latitude: #{resident_lgu_response.latitude}<br>Disaster: #{resident_lgu_response.lgu_response.disaster_type}<br>Name:#{resident_lgu_response.resident.first_name} #{resident_lgu_response.resident.last_name}"
       marker.picture({
       "width" =>  38,        
       "height" => 61
       })
    end
  end

  def contact
  end

  def donate
  end

  def navbar
  end
end
