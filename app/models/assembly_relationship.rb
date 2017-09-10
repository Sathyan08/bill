class AssemblyRelationship < ActiveRecord::Base
  validate :different_assemblies

  belongs_to :assembly
  belongs_to :sub_assembly, class_name: "Assembly"

  private

  def different_assemblies
    if assembly_id == sub_assembly_id
      errors.add(:sub_assembly_id, "The sub-assembly cannot be the same as the assembly.")
    end
  end
end
