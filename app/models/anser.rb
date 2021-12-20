class Anser < ApplicationRecord
    belongs_to :question
    has_many :question
end
