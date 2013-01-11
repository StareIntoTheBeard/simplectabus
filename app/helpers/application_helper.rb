module ApplicationHelper
	def getTime(route,stop,key)
		doc = Nokogiri::HTML(open("http://www.ctabustracker.com/bustime/api/v1/getpredictions?key=#{key}&rt=#{route}&stpid=#{stop}"))
		@doc = Hash.from_xml(doc.to_s)
		render 'bustimes/time'
	end
end