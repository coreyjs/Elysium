class Narrative::StepType < ApplicationRecord

  def self.find_by_code(code)
    Narrative::StepType.find_by(code: code)
  end

end

# == Schema Information
#
# Table name: narrative_step_types
#
#  id         :bigint           not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_narrative_step_types_on_code  (code) UNIQUE
#
