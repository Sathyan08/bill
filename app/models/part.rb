class Part < ActiveRecord::Base
  has_many :assembly_parts
  has_many :assemblies, through: :assembly_parts
end
