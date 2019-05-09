class Story < ApplicationRecord

  validates :name, :link, presence: true

  has_many :votes do
    def latest
      order('id DESC').limit(3)
    end
  end


  # override to_param in the model to make user_path construct a path
  # using the user's name instead of the user's id:
  def to_param
    "#{id}-#{name.gsub(/\W/, "-").downcase}"
  end

end
