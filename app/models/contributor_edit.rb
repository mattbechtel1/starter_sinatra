class ContributorEdit < ActiveRecord::Base
    belongs_to :article
    belongs_to :contributor
end