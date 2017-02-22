def call_me(some_code)
  name = "Robert"
  some_code.call            # call will execute the "chunk of code" that gets passed in
end

name = "Danny"
chunk_of_code = Proc.new { puts "Hi #{name}" }
name = "Griffin"

call_me(chunk_of_code)
