class Project < ApplicationRecord
  scope :active, -> { where(deleted: false) }
  #order scope by updated_at
  scope :recent, -> { order(updated_at: :desc) }

  has_many :narrative_series, :class_name => 'Narrative::Series', :foreign_key => 'project_id'

  validates :title, uniqueness: true, presence: true
end

# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  deleted    :boolean          default(FALSE)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
