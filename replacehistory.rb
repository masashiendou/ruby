require 'csv'

csvfile = './browsehistory/history.csv'
intro_msg = ""

puts "start..."

File.open("./result/replaced.txt", 'w') do |file|
  CSV.foreach(csvfile, encoding: "UTF-8", headers: true) do |data|
urls = "#{data["url"]}\n"
    if urls !~ /google/ then
      if urls =~ /^http:\/\/.*/ then
        urls = urls.sub(/^http:\/\//, "")
        urls = urls.sub(/\/.*/, "")
      else urls =~ /^https:\/\/.*/
        urls = urls.sub(/^https:\/\//, "")
        urls = urls.sub(/\/.*/, "")
      end
        if intro_msg.include?(urls) === true then
          delete_msg = urls
        elsif
          intro_msg = urls
          puts intro_msg
          file.write(intro_msg)
        end
    else
      delete_msg = urls
    end
  end
end

puts "complete! See replaced.txt."
