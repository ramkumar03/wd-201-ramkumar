def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

#the parse_dns function uses the raw data from zone file to create a record collection
def parse_dns(dns_raw)
  data = []

  dns_raw.each { |line|
    if (!(line == "\n" || line[0] == "#"))
      data.push(line.split(", "))
    end
  }
  records = {}

  data.each { |item|
    records[item[1]] = { type: item[0], target: item[2].chomp }
  }

  return records
end

#########################################################

#the resolve function is used to check with the domain name and the target recursively
# until it finds the A type target with IP address

def resolve(dns_records, lookup_chain, domain)
  record = dns_records[domain]
  if !record
    lookup_chain[0] = "Error: Record not found for " + domain
  elsif record[:type] == "CNAME"
    lookup_chain.push(record[:target])
    return resolve(dns_records, lookup_chain, record[:target])
  elsif record[:type] == "A"
    lookup_chain.push(record[:target])
  end
  return lookup_chain
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
