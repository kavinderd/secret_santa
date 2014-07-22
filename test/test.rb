$:.unshift('.')
$:.unshift('./lib')
$:.unshift('..')
$:.unshift('../lib')

require 'secret_santa'
require 'minitest/autorun'

class SecretSantaTest < Minitest::Test

  def test_accept_name_parameters
  	ss =SecretSanta.new
  	ss.input_record('Test', 'Santa', 'santa@northpole.com')
  	assert_equal ss.records, [['Test', 'Santa', 'santa@northpole.com']]
  end

end
