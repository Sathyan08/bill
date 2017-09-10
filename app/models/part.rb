class Part < ActiveRecord::Base
  has_many :assembly_parts
  has_many :assemblies, through: :assembly_parts

  has_one :id_tag, as: :id_taggable
end
