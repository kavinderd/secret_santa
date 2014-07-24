$:.unshift('.')
$:.unshift('./lib')
$:.unshift('..')
$:.unshift('../lib')

require 'secret_santa'
require 'minitest/autorun'

class SecretSantaTest < Minitest::Test

  def test_accept_name_parameters
  	ss =SecretSanta.new
  	ss.input_record(first_name:'Test', last_name:'Santa', email:'santa@northpole.com')
  	assert_equal ss.records, [['Test', 'Santa', 'santa@northpole.com']]
  end

  def test_accept_multiple_name_parameters
  	ss =SecretSanta.new
  	ss.input_record(first_name:'Test', last_name:'Santa', email:'santa@northpole.com')
  	ss.input_record(first_name: 'Santa', last_name: 'Clause', email: 'clause@northpole.com')
  	assert_equal ss.records.last, ['Santa', 'Clause', 'clause@northpole.com']
  end

  def test_dissallow_identical_emails
  	ss = SecretSanta.new
  	ss.input_record(first_name:'Test', last_name:'Santa', email:'santa@northpole.com')
  	assert_raises(DuplicateEmailException) { ss.input_record(first_name:'Clause', last_name:'Santa', email:'santa@northpole.com')}
  end

  def test_assign_santas
  	ss = SecretSanta.new
  	ss.input_record(first_name: 'Mother', last_name: 'Clause', email: 'motherclause@northpole.com')
  	ss.input_record(first_name: 'Santa', last_name: 'Clause', email: 'santaclause@northpole.com')
  	ss.input_record(first_name: 'Fred', last_name: 'Clause', email: 'fredclause@northpole.com')
  	ss.input_record(first_name: 'Mary', last_name: 'Clause', email: 'maryclause@northpole.com')
  	ss.input_record(first_name: 'Rudolph', last_name: 'Reindeer', email: 'rudolph@northpole.com')
  	ss.input_record(first_name: 'Short', last_name: 'Elf', email: 'short@northpole.com')
  	ss.input_record(first_name: 'Tall', last_name: 'Elf', email: 'tall@northpole.com')
  	ss.input_record(first_name: 'Adam', last_name: 'Kid', email: 'kid@earth.com')
  	ss.assign_santas
  	assert_equal 4, ss.assignments.count
  end

end
