class Person < ActiveRecord::Base
  belongs_to :father, :class_name => 'Person'
  belongs_to :mother, :class_name => 'Person'
  has_many :children_of_father, :class_name => 'Person', :foreign_key => 'father_id'
  has_many :children_of_mother, :class_name => 'Person', :foreign_key => 'mother_id'
  def children
     children_of_mother + children_of_father
  end
end

HTTParty.get( "#{ @settings.api_server }#{ url }", :verify => false ).parsed_response
