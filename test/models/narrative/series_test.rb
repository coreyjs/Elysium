# == Schema Information
#
# Table name: narrative_series
#
#  id          :bigint           not null, primary key
#  description :string
#  export_name :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :bigint           not null
#
# Indexes
#
#  index_narrative_series_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
require "test_helper"

class Narrative::SeriesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
