class MainController < ApplicationController
  def index
  end

  def events
  end

  def sponsorship
  end

  def about_us
  end

  def newsletter
    @paths = Dir["app/assets/pdf/newsletters/*"]
    @files = []
    @fileLink = Hash.new
    #fileLink['hey'] = 'hey'
    for f in @paths
      if f =~ /assets\/pdf\/newsletters\/(.*)\.pdf/
        @files.push($1)
        @fileLink[$1] = ActionController::Base.helpers.asset_path('newsletters/'+$1+'.pdf')
      end
    end 
    test = 'test'
    #str = ActionController::Base.helpers.asset_path('newsletters/week6.pdf') 
  end

  def contact_us
  end
end
