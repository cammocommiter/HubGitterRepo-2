@search = Model.new_search(params[:search])
@search.condition.field_starts_with = "prefix"
@models = @search.all

disable-binary