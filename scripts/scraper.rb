add-on
Promotion.joins(:category).
         where(["lft>=? and rgt<=?", c.lft, c.rgt]).
         joins(:shops).
         where(:promotions_per_shops => { :shop_id => shops_id }).
         count('id', :distinct => true)
