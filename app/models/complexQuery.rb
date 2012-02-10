class ComplexQueries < ActiveRecord::Base
  def self.my_query
    # Notice how you can, and should, still sanitize params here.
    self.connection.execute(sanitize_sql(["select b.id, b.`descripcion` as 'Category', a.id, a.`descripcion` from categories a left join categories b on a.category_id = b.id order by b.id, a.id desc "])
    )
  end
end

