=begin

#todo array structure and formatter //array method

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]
new_todos = []
category = []

todos.each { |kind|
  if category.find { |i| i == kind[1] } == nil
    category.push(kind[1])
  end
}

temp_category = []

category.map { |category|
  items = []
  temp_category = []
  todos.map { |x|
    if x[1] == category
      items.push(x[0])
    end
  }

  temp_category.push(category)
  temp_category.push(items)
  new_todos.push(temp_category)
}


new_todos.map { |x|
  puts x[0] + ":"

  x[1].map { |item|
    puts "\t" + item
  }
}
=end

#######################################################

=begin

#book author library hash

books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]

library = {}
split_name = authors.map { |x| x.split(" ") }
first_name = split_name.map { |x| x[0] }

first_name.each.with_index { |name, i|
  sym = name.to_sym

  library[sym] = books[i]
}
puts library

=end

###########################################################

=begin

#todo array structure and formatter //hashes method

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]

library = {}

category = []

todos.each { |kind|
  if category.find { |i| i == kind[1] } == nil
    category.push(kind[1])
  end
}

category.each.with_index { |name, i|
  sym = name.to_sym
  items = []
  todos.each { |todo|
    if todo[1] == name
      items.push(todo[0])
    end
  }
  library[sym] = items
}

puts library

=end

######################################################################

=begin

#salutation function definition

def salute(name, salutation)
  last_name = (name.split(" ")).last

  statement = "#{salutation.capitalize} Mr. #{last_name}"
end

puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")

=end

#########################################################################
