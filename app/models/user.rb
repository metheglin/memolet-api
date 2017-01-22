require 'securerandom'

class User < ApplicationRecord
  before_create :set_auth_token

  private
    def set_auth_token
      return if auth_token.present?
      self.auth_token = SecureRandom.uuid.gsub(/\-/, '')
    end

end
