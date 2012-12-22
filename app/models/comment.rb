class Comment < ActiveRecord::Base
  attr_accessible :story_id, :text, :user_id

  belongs_to :user
  belongs_to :story

  validates_presence_of :user_id
  validates_presence_of :text

  def created_at_str
    created_at.strftime "%a %m/%d/%y %H:%M"
  end
end
