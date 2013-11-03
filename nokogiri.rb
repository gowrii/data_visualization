require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'debugger'

File.open('books.html', 'r') do |f|
	url = "http://www.chapters.indigo.ca/books/big-fall-books/"
	data = Nokogiri::HTML(open(url))

	# debugger

	books = data.css('li.product')
	f.puts ("<!DOCTYPEhtml>")
	f.puts ("<html>")
	f.puts ("</head>")
	f.puts ("<title>For the Love of books</title>")
	f.puts ("<link rel='stylesheet' type='text/css' href='ibooks.css'>")
	f.puts ("<head>")
	f.puts ("<body>")
	f.puts ("<header>")
	f.puts ("</header>")

	books.each do |book|
		title = book.at_css('.product-title')
		contributer = book.at_css('.product-contributor')
		available = book.at_css('.product-availability')
		list = book.at_css('.list-price')
		price = book.at_css('.online-price')
		#image = book.css('div.content img')['src']
		#image = book.at_css('img.product-img')['src']


		#f.puts image
		#f.puts ("<img>" +image+ '</img>')
		f.puts("<div class = 'section'>")
		f.puts("<div class = 'text'>")
		f.puts("<div class = 'title'>" + title + '</div>')
		f.puts("<div class = 'author'>" + contributer + '</div>')
		f.puts("<div class ='avail'>" + available + '</div>')
		f.puts("<div class ='list'>" + list + '</div>')
		f.puts("<div class ='price'> " + price + '</div>')
		f.puts("</div>")
		f.puts("</div>")
		
	end
	f.puts ("<footer>")
	f.puts ("</footer>")
	f.puts ("</body>")
	f.puts ("</html>")

end


	
 