class Post < ActiveRecord::Base

  def display_entry
    "#{entry}"
  end
  
end
