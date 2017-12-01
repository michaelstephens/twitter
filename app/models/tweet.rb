include ActionView::Helpers::UrlHelper

class Tweet < ApplicationRecord
  has_many :replies
  validates :content, presence: true
  belongs_to :user

  def at_mention_content
    content_hash = {}
    content.split(" ").each_with_index do |c, i|
      content_hash[i] = c
    end

    content_hash.select{|k, v| v.include? "@" }.each do |k,v|
      user = User.where(username: v.gsub("@", "")).first
      skip if user.blank?
      content_hash[k] = link_to v, Rails.application.routes.url_helpers.user_path(user.id)
    end

    content_hash.values.join(" ")
  end
end
