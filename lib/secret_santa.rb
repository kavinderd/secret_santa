class SecretSanta
  attr_reader :records, :assignments

  def initialize
    @records = []
  end


  def input_record(first_name:, last_name: , email:)
  	raise DuplicateEmailException if @records.flatten.include?(email)
  	@records << [first_name, last_name, email]
    puts "current records\n #{@records}"
  end

  def assign_santas
  	@assignments = []
  	while @records.count > 0
  	  r = @records.shift
  	  match =nil
  	  loop do
	    match = @records.sample
  	  	match
  	  	break if r[1] != match[1]
  	  end
  	  index = @records.index(match)
  	  @records.delete_at(index)
  	  @assignments << [r, match]
    end
  end

end

class DuplicateEmailException < Exception; end;