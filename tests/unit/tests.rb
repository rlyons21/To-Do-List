require_relative '../test_helper'

class TaskTest < Minitest::Test
	def setup
    	super
    end   
 	def test_searchForName
  		@names = Task.searchForName
  		puts @names
  	end
end