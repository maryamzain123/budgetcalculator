class Entry < ActiveRecord::Base 
    belongs_to :user
    
    validates :subject, :details, presence: true
end