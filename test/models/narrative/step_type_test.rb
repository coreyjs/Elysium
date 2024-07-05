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
require "test_helper"

class Narrative::StepTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
