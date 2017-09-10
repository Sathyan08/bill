class IdTag < ActiveRecord::Base
  belongs_to :id_taggable, polymorphic: true
  validates :identifier, uniqueness: true, presence: true
end
