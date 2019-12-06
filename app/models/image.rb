class Image < ApplicationRecord
  acts_as_taggable_on :tags

  validates :url, format: {with: URI::DEFAULT_PARSER.make_regexp(['http', 'https'])}
end
