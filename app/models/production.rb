class Production < ApplicationRecord
  belongs_to :production_kind

  validates_presence_of :title
end
