class AssemblyRelationship < ActiveRecord::Base
  belongs_to :assembly
  belongs_to :sub_assembly, class_name: "Assembly"
end
