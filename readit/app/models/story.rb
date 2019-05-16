class Story < ApplicationRecord

  belongs_to :user

  validates :name, :link, presence: true

  after_create :create_initial_vote

  has_many :votes do
    def latest
      order('id DESC').limit(3)
    end
  end

  scope :upcoming, -> { where("votes_count < 5").order("id DESC") }
  scope :popular, -> { where("votes_count >= 5").order("id DESC") }

  # override to_param in the model to make user_path construct a path
  # using the user's name instead of the user's id:
  def to_param
    "#{id}-#{name.gsub(/\W/, "-").downcase}"
  end

  private

  def create_initial_vote
    votes.create user: user
  end

end
