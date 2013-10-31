class Visit
  include Mongoid::Document

  field :date_played, type: Date
  field :location, type: String
  field :visit_type, type: String
  field :stakes, type: String
  field :hours_played, type: Float
  field :profit_or_loss, type: Float
  field :notes, type: String

  embedded_in :user
  # class_name:"User", inverse_of: :user

end
