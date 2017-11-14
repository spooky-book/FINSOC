class MainController < ApplicationController
  def index
    # TODO Clean up show_new_page variable
    render "main/index", locals: { show_new_page: true }
  end

  def events
  end

  def sponsorship
    render "main/sponsorship", locals: { show_new_page: true }
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

  #def new
  #  render "main/index", locals: { show_new_page: true }
  #end

  #def newsponsors
  #  render "main/sponsorship", locals: { show_new_page: true }
  #end
end
