# encoding:utf-8
#Cüneyt ÇARIKÇİ
#cuneyt.carikci@gmail.com
#30.11.2014

#gerekli kütüphaneler import ediliyor
require 'nokogiri'
require 'open-uri'
require 'net/https'

class Sozluk

def initialize
@url = "https://eksisozluk.com/ogrenildiginde-ufku-iki-katina-cikaran-seyler--2593151?p=1"
end

def parseList(params)
#verilen urldeki kaynak kodlar incelenince bura daha anlaşılır olacaktır
temp = params.css('div') 
counter = temp.size
	for i in 0..counter/3
		if temp[3*i]!=nil
			print i.to_s+": "+temp[3*i].text
			print "\n--------------------------------------------------------------------------------\n"
		end
	end
end

def get_response
uri = @url;

response = Nokogiri::HTML(open(uri,  :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE),nil,'utf-8')

print "================================================================================\n\n"
parseList(response.css('ol').css('li'))
end
end

def main

sozluk = Sozluk.new

sozluk.get_response

end

main # asil islerin atesleyecek yeri seciyoruz
