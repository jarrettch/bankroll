class Score
include Mongoid::Document

field :test_name, type:String
field :test_score, type:Float

belongs_to :user
end