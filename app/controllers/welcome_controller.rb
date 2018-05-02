require "base64"
class WelcomeController < ApplicationController

  def index
    file_content = Base64.encode64(IO.read("#{Rails.root}/app/test.docx"))
    uri =  URI.parse("http://localhost:4000/api/upload")
    http = Net::HTTP.new(uri.host, uri.port)
    data = {
        content: file_content
    }
    req = Net::HTTP::Post.new(uri)
    req.body = data.to_json
    @res = http.request(req)

  end
end