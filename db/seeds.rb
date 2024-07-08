# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Default fields Roots
DefaultPropertyField.find_or_create_by!(name: "QuestId", property_type: :string, export_name: "QuestId", default_for_root: true, show: true)
DefaultPropertyField.find_or_create_by!(name: "Name", property_type: :string, export_name: "QuestName", default_for_root: true, show: true)
DefaultPropertyField.find_or_create_by!(name: "LogDescription", property_type: :string, export_name: "LogDescription", default_for_root: true, show: false)
DefaultPropertyField.find_or_create_by!(name: "TrackerDescription", property_type: :string, export_name: "TrackerDescription", default_for_root: true, show: false)
DefaultPropertyField.find_or_create_by!(name: "CompletedLogText", property_type: :string, export_name: "CompletedLogText", default_for_root: true, show: false)
DefaultPropertyField.find_or_create_by!(name: "QuestType", property_type: :string, export_name: "QuestType", default_for_root: true, show: false)
DefaultPropertyField.find_or_create_by!(name: "NextQuestId", property_type: :string, export_name: "NextQuestId", default_for_root: true, show: true)
DefaultPropertyField.find_or_create_by!(name: "PrerequisiteQuests", property_type: :string, export_name: "PrerequisiteQuests", default_for_root: true, show: false)

# Default fields Steps
DefaultPropertyField.find_or_create_by!(name: "TaskId", property_type: :string, export_name: "TaskId", default_for_step: true, show: true)
DefaultPropertyField.find_or_create_by!(name: "TrackerHeader", property_type: :string, export_name: "TrackerHeader", default_for_step: true, show: false)
DefaultPropertyField.find_or_create_by!(name: "TaskName", property_type: :string, export_name: "TaskName", default_for_step: true, show: true)
DefaultPropertyField.find_or_create_by!(name: "LogDescription", property_type: :string, export_name: "LogDescription", default_for_step: true, show: false)
DefaultPropertyField.find_or_create_by!(name: "bIsOptional", property_type: :boolean, export_name: "bIsOptional", default_for_step: true, show: true)
DefaultPropertyField.find_or_create_by!(name: "Ordinal", property_type: :integer, export_name: "Ordinal", default_for_step: true, show: false)
DefaultPropertyField.find_or_create_by!(name: "PreTaskGameplayEventId", property_type: :string, export_name: "PreTaskGameplayEventId", default_for_step: true, show: false)
DefaultPropertyField.find_or_create_by!(name: "PostTaskGameplayEventId", property_type: :string, export_name: "PostTaskGameplayEventId", default_for_step: true, show: false)
DefaultPropertyField.find_or_create_by!(name: "NextTaskId", property_type: :string, export_name: "NextTaskId", default_for_step: true, show: true)
DefaultPropertyField.find_or_create_by!(name: "Quantity", property_type: :integer, export_name: "Quantity", default_for_step: true, show: false)

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
  nr = Narrative::Root.new_with_defaults!(title: "Quest #{i}")
  4.times do |j|
    nr.narrative_property_fields << Narrative::PropertyField.new(name: "field_#{j}", property_type: :string, export_name: "Field_#{j}", value: "whhjh#{j}")
  end
  ns1.narrative_roots << nr
end


5.times do |i|
  nr = Narrative::Root.new_with_defaults!(title: " Side Quest #{i}")
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

  3.times do |i|
    ns = Narrative::Step.new_with_defaults!
    nr.narrative_steps << ns
  end

end


project.save!