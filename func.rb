# require_relative 'bundle/bundler/setup'
require 'ruby-manta'
require 'fastimage_resize'
# require 'pry'

host       = ENV['MANTA_URL']
user       = ENV['MANTA_USER']
priv_key   = ENV['MANTA_KEY' ]
upload_dir = ENV['LOCAL_DIR' ]

priv_key_data = File.read(priv_key)
client = RubyManta::MantaClient.new(host, user, priv_key_data,
                                    :disable_ssl_verification => true
                                   )

path = "/irontreeder/stor/iron-fn-demo/"

payload = STDIN.read
if payload != ""
    payload = JSON.parse(payload)
    file = payload['file']
    height = payload['height']
    width = payload['width']
end

data, _ = client.get_object(path + file)

File.open(file, 'w') { |file| file.write(data) }

outfile = FastImage.resize(file, width, height)

client.put_object(path + resized_file, outfile.read)
