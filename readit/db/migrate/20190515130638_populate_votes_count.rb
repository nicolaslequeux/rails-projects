class PopulateVotesCount < ActiveRecord::Migration[5.2]
  def change
    Story.find_each do |s|
      Story.reset_counters(s.id, :votes)
    end
  end
end
