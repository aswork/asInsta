class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
      @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

      if @user.persisted?
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
        sign_in_and_redirect @user, event: :authentication
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
    def twitter
        # You need to implement the method below in your model
        @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)

        if @user.persisted?
          set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
          sign_in_and_redirect @user, event: :authentication
        else
          session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
          redirect_to new_user_registration_url
        end
      end

      def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
      user = User.find_by(provider: auth.provider, uid: auth.uid)

      unless user
        user = User.new(
            name:     auth.info.nickname,
            image_url: auth.info.image,
            provider: auth.provider,
            uid:      auth.uid,
            email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
            password: Devise.friendly_token[0, 20]
        )
        user.skip_confirmation!
        user.save
      end
      user
    end

end
