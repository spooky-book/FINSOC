class MainController < ApplicationController
  def index
    render "main/index", locals: { show_new_page: false }
  end

  def events
  end

  def sponsorship
    render "main/sponsorship", locals: { show_new_page: false}
  end

  def about_us
  end

  def newsletter
  end

  def contact_us
  end

  def publications
  end

  def course_guide
  end

  def hsbc_womens_mentoring
  end

  def new
    render "main/index", locals: { show_new_page: true }
  end

  def newsponsors
    render "main/sponsorship", locals: { show_new_page: true }
  end
end
