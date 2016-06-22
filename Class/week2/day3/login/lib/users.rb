class Users
  def initialize
    @users = {
      :alina => "alinapassword",
      :marjon => "marjon password"
    }
  end
  def login(user, password)
    if @users.has_key?(user.to_sym)
      if @users[user.to_sym] == password
        return true
      else
        return false
      end
    end
  end
end
