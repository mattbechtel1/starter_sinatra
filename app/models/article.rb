class Article < ActiveRecord::Base
    has_many :contributor_edits
    has_many :contributors, through: :contributor_edits
end