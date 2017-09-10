class Assembly < ActiveRecord::Base
  has_many :assembly_relationships
  has_many :sub_assemblies, through: :assembly_relationships

  has_many :parent_assembly_relationships, class_name: "AssemblyRelationship", foreign_key: 'sub_assembly_id'
  has_many :parent_assemblies, through: :parent_assembly_relationships, source: :assembly
end
