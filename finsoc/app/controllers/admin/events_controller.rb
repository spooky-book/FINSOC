class Admin::EventsController < AdminController
  def index
    @events = Event.all
    render 'admin/events'
  end

  def create
    permitted = params.require(:data).permit(:title, {:date => [:year, :month, :day]}, :picture)
    date = Date.new(
      permitted[:date][:year].to_i, 
      permitted[:date][:month].to_i,
      permitted[:date][:day].to_i)
    filename = upload_picture(permitted[:picture])
    @event = Event.new(title: permitted[:title], date: date, location: filename)
    if @event.save
      redirect_to "events/index"
    else
      render nothing: true
    end
  end

  def update
    permitted = params.require(:data).permit(:title, {:date => [:year, :month, :day]}, :picture)
  end

  def delete
  end

  private
  def upload_picture(picture)
    filename = picture.original_filename
    File.open(Rails.root.join('app/assets', 'images/events', filename), 'wb') do |file|
      file.write(picture.read)
    end
    return filename
  end
end
