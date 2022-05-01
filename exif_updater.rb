require 'multi_exiftool'

filenames = Dir['**/*.{jpg,JPG,jpeg,JPEG}']

reader = MultiExiftool::Reader.new

reader.filenames = filenames

results = reader.read

unless reader.errors.empty?
  $stderr.puts reader.errors
end

batch = MultiExiftool::Batch.new

results.each do |values|
  date_time_original = values["datetimeoriginal"]
  batch.write values.source_file, {filemodifydate: date_time_original}
end

if batch.execute
  puts 'ok'
else
  puts batch.errors
end
