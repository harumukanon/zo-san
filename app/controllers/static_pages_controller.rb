class StaticPagesController < ApplicationController
  def home
  end
  
  def about
  end
  
  def manual
    @logo = Cloudinary::Uploader.multi("logo", :format => 'zip')
  end
  
end
