@posts = Post.joins("LEFT OUTER JOIN users ON users.id = posts.user_id").
              joins(:blog).select

10.minutes.ago
2.days.since
