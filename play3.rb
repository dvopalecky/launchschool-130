name = "Robert"
chunk_of_code = Proc.new {puts "Hi #{name}"}
name = "Bob"        # re-assign name after Proc initialization
chunk_of_code.call # => Hi Bob
