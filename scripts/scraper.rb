$:.push File.expand_path(File.dirname(__FILE__) + '/../surfcompstuff')

expect(@article.updated_at.utc.to_s).to eq(Time.now.to_s)
