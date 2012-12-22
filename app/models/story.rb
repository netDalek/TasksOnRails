class Story < ActiveRecord::Base
  attr_accessible :state, :title, :user_id

  validate :title, :presence => true

  belongs_to :user
  has_many :comments

  scope :by_user_id, proc { |user_id| where(:user_id => user_id) }
  scope :by_state, proc { |state| where state: state }
  scope :not_assigned, where(user_id:nil)

  state_machine :state, :initial => :created do
    state :created
    state :started
    state :finished
    state :delivered
    state :accepted
    state :rejected

    event :start do
      transition :created => :started
    end

    event :finish do
      transition :started => :finished
    end

    event :deliver do
      transition :finished => :delivered
    end

    event :accept do
      transition :delivered => :accepted
    end

    event :reject do
      transition :delivered => :rejected
    end

    event :restart do
      transition :rejected => :started
    end
  end

  def username
    user.name if user
  end

  def created_at_str
    created_at.strftime "%a %m/%d/%y %H:%M"
  end

  def self.all_states
    self.state_machine.states.map &:name
  end
end
