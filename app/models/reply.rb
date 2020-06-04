class Reply < ApplicationRecord
    belongs_to :topic
    belongs_to :user

    enum status: [ :agree, :disagree, :unproductive, :raise ]
end
