class StaticPagesController < ApplicationController
  def home
  end
  
  def about
　　@logo = Cloudinary::Uploader.multi("logo", :format => 'zip')
  end
  
  def manual
  end
  
end
