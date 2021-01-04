before_filter { |c| c.authenticate_rights correct_id_here }

def authenticate_rights(project_id)
  project = Project.find(project_id)
  redirect_to signin_path unless project.hidden
end

rvm use 1.9.3 --default