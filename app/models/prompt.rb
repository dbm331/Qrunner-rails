class Prompt < ActiveRecord::Base

      belongs_to :question
      belongs_to :test

end
