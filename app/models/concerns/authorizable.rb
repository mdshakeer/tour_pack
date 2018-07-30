module Authorizable
	extend ActiveSupport::Concern

	included do
	end

	def is_admin?
		user_type == "ADMIN"
	end

	module ClassMethods		
	end
end