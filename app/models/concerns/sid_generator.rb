require 'digest/md5'

module SidGenerator
  extend ActiveSupport::Concern

  included do
    protected

    def generate_sid
      puts "SidGenerator#generate_sid class:#{self.class} id:#{id}"
      self.sid = Digest::MD5.hexdigest('sid' + id.to_s + 'salt')
    end
  end
end
