#each
result = Users.find(:all, :order => "LOWER(name)")
