require 'rubygems'
require 'rest_client'
require 'open-uri'

def fetch_wiki_page (htmlpage)
  wiki_url = "http://en.wikipedia.org/"
  wiki_local_filename = htmlpage
  File.open(wiki_local_filename, "w") do |file|
    file.write(RestClient.get(wiki_url))
  end
end

def hamlet
  url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
  local_fname = "hamlet.txt"
  File.open(local_fname, "w"){|file| file.write(open(url).read)}
  File.open(local_fname, "r") do |file|
    file.readlines.each_with_index do |line, index|
      if index % 42 == 41
        puts line
      end
    end
  end
end

def read_hamlet
  is_hamlet_speaking = false
  File.open("hamlet.txt", "r") do |file|
    file.readlines.each do |line|

      if is_hamlet_speaking == true && ( line.match(/^  [A-Z]/) || line.strip.empty? )
        is_hamlet_speaking = false
      end

      is_hamlet_speaking = true if line.match("Ham \.")

      puts line if is_hamlet_speaking == true
    end
  end
end

fetch_wiki_page("wiki-page.html")
hamlet
read_hamlet



