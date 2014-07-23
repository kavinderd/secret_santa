class SecretSanta
  attr_reader :records

  def initialize
    @records = []
  end

  def input_record(first_name:, last_name: , email:)
  	@records << [first_name, last_name, email]
  end

end