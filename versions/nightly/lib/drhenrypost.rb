class DrHenryPost

  # Gets today's date
  def date
    time = Time.new
    date = time.strftime("%Y-%m-%d")
    return date.to_s
  end

  # Sets post filename
  def name
    string = []

    if ARGV.empty?
      puts "You have not provided a title for the post. Please introduce a title."
      print "> "
      STDOUT.flush
      joinName = gets.chomp
	nameArray = joinName.split(' ')
	  nameArray.each do |s|
	    string.push(s)
	  end	
    else
      ARGV.each do |a|
        string.push(a)
      end
    end

    joinName = string.join('-')
    return joinName
  end

  # Sets post title (into the file)
  def title(postName)
    pn = postName.tr('-', ' ')
    pn = pn.gsub(/[-!$%^&*()_+|~=`{}\[\]:";'<>?,.\/]/, '')
  end

  # Creates the file
  def create(date, filename, title)
    output = File.new("#{date}-#{filename}.md", "w")
    output.puts("---")
    output.puts("layout: post" + " # note, post, report, capture")
    output.puts("title: " + "#{title}")
    output.puts("date: " + "#{date}")
    output.puts("description: ")
    output.puts("keywords: ")
    output.puts("coments: ")
    output.close
  end

end
