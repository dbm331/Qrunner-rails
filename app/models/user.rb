class User < ActiveRecord::Base
      before_create :confirmation_token

      has_secure_password

      validates_uniqueness_of :email

      def editor?
      	  self.role == 'editor'
      end

      def admin?
      	  self.role == 'editor' 
      end

      def send_password_reset
      	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  UserMailer.password_reset(self).deliver
      end

      def email_activate
      	  self.email_confirmed = true
	  self.confirm_token = nil
	  save!(:validate => false)
      end
      
    private
      def generate_token(column)
      	  begin
		self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
      end
    

      private
	def confirmation_token
	    if self.confirm_token.blank?
	       self.confirm_token = SecureRandom.urlsafe_base64.to_s
	    end
	end

end
