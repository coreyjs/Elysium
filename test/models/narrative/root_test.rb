# == Schema Information
#
# Table name: narrative_roots
#
#  id                  :bigint           not null, primary key
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  narrative_series_id :bigint           not null
#
# Indexes
#
#  index_narrative_roots_on_narrative_series_id  (narrative_series_id)
#
# Foreign Keys
#
#  fk_rails_...  (narrative_series_id => narrative_series.id)
#
require "test_helper"

class Narrative::RootTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
