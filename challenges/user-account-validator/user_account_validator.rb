class UserAccountValidatorError < StandardError
end

class UserAccountValidatorError
  attr_reader :email, :username, :name

    def initialize
      @users
      @email = user[:email]
      @username = user[:usernames]
      @name = user[:name]

      if @email == nil
        raise UserAccountValidatorError, "no email"
      end

      unless @email.include?('@')
        raise UserAccountValidatorError, "bad email, no @"
      end

      if @username == ""
        raise UserAccountValidatorError, "no username provided"
      end

    end

end
