class StaticPagesController < ApplicationController
  def home
  	@contact = Contact.new
  end

  def help
  end

  def about
  end
end
