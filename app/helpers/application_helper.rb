module ApplicationHelper
	def getTime(stop)
		doc = Nokogiri::HTML(open("http://www.ctabustracker.com/bustime/api/v1/getpredictions?key=kRBbPLQJ5L8GXuCeTdRpKU8Xg&rt=9&stpid=#{stop}"))
		@doc = Hash.from_xml(doc.to_s)
		render 'bustimes/time'
	end
end