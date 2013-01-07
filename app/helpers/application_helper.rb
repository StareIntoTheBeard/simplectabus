module ApplicationHelper
	def getTime(route,stop)
		doc = Nokogiri::HTML(open("http://www.ctabustracker.com/bustime/api/v1/getpredictions?key=kRBbPLQJ5L8GXuCeTdRpKU8Xg&rt=#{route}&stpid=#{stop}"))
		@doc = Hash.from_xml(doc.to_s)
		render 'bustimes/time'
	end
end