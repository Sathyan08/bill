# README

This repository contains an Active Record schema to represent a bill of materials.  A bill of
materials is an `Assembly` that may contain sub_assemblies and parts.  A bill of materials does
not belong to any other assembly.  Assemblies and parts can both have a unique identifier that canno
be shared by any other part or assembly.

To accomplish this goal, the schema contains three main features.  First, it contains a self-join
table to connect one assembly to another.  An assembly can belong to multiple parent assemblies because through this join table called `AssemblyRelationship`.  The join table also has a `sub_assembly_quantity` column to track how many sub_assemblies belong to the parent assembly.  Moreover, the `AssemblyRelationship` also has a custom validation to ensure that an assembly cannot belong to itself.

The assemblies can also have many `parts` through a join table called `AssemblyPart`.  This way, a part can belong to many assemblies.  This join table also has a column called `part_quantity` to record how many parts belong to a particular assembly.

The bill of goods can be created by loading the bill of materials with its own parts, along with all of its sub-assemblies and all of their sub-assemblies and parts, recursively.  In production, I would probably write a method to eagerly load each of these components of the bill of materials.

Lastly, every part and assembly is `id_taggable` which means that they can have a single `IdTag`.  Through polymorphic associations, we can track the type and id of the part or assembly that the id tag belongs to.
