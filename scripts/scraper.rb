def show
  @city = @user.city.present?
end

Date.parse