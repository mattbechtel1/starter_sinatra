class Contributor < ActiveRecord::Base
    has_many :contributor_edits
    has_many :articles, through: :contributor_edits
end