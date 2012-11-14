class Message < ActiveRecord::Base
  attr_accessible :body, :email, :name, :subject
end
