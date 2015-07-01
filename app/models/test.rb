class Test < ActiveRecord::Base

      has_many :topics
      has_many :questions, through: :topics
      has_many :prompts, through: :questions

end
