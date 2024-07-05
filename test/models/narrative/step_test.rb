# == Schema Information
#
# Table name: narrative_steps
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  narrative_root_id :bigint           not null
#
# Indexes
#
#  index_narrative_steps_on_narrative_root_id  (narrative_root_id)
#
# Foreign Keys
#
#  fk_rails_...  (narrative_root_id => narrative_roots.id)
#
require "test_helper"

class Narrative::StepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
