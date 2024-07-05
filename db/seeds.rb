# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create StepTypes
Narrative::StepType.find_or_create_by!(code: 'EQSTT_Location', name: 'location')
Narrative::StepType.find_or_create_by!(code: 'EQSTT_Interact', name: 'interact')


# Create a project
project = Project.find_or_create_by!(title: 'Project Shooter Game')

ns1 = Narrative::Series.find_or_create_by!(title: 'Main Quests', description: 'Main Quests', project: project)
ns2 = Narrative::Series.find_or_create_by!(title: 'Side Quests', description: 'Side quests', project: project)

ns1.narrative_roots.destroy_all
ns2.narrative_roots.destroy_all

# Build Each Rooc
3.times do |i|
  nr = Narrative::Root.new(title: "Quest #{i}")
  4.times do |j|
    nr.narrative_property_fields << Narrative::PropertyField.new(name: "field_#{j}", property_type: :string, export_name: "Field_#{j}", value: "whhjh#{j}")
  end
  ns1.narrative_roots << nr
end


5.times do |i|
  nr = Narrative::Root.new(title: " Side Quest #{i}")
  2.times do |j|
    nr.narrative_property_fields << Narrative::PropertyField.new(name: "field_#{j}", property_type: :string, export_name: "Field_#{j}", value: 100.20)
  end
  ns2.narrative_roots << nr
end


# Add fields to root and steps
ns1.narrative_roots.each do |nr|
  nr.narrative_property_fields << Narrative::PropertyField.new(name: 'quest_id', property_type: :string, export_name: "QuestId", value: "q_0_1")
  nr.narrative_property_fields << Narrative::PropertyField.new(name: 'quest_name', property_type: :string, export_name: "QuestName")
  nr.narrative_property_fields << Narrative::PropertyField.new(name: 'ordinal', property_type: :integer, export_name: "Ordinal")
end


project.save!