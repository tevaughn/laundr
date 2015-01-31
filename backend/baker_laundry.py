from lxml import html
import requests
import re
import time


with open('bakerLaundryUsage.csv', 'a') as f:

	while True:
		# Scrape the baker laundry page
		page = requests.get('http://laundryalert.com/cgi-bin/rice3927/LMRoom?CallingPage=LMRoom&Halls=0&RoomPersistence=&MachinePersistenceA=003&MachinePersistenceB=001')
		tree = html.fromstring(page.text)

		# Get the number of avaliable washers and dryers
		availableTextsRaw = tree.xpath('//table[@id="tablea"]/tr/td/form[@name="form1"]/div/table/tr//text()')
		availableTexts = [a.strip() for a in availableTextsRaw if a.strip() != '']

		# Get the states of all the appliances
		appliances = tree.xpath('//table[@id="tablea"]/tr/td/form[@name="form1"]/table/tr')
		for row in appliances:
			print row
			print [a.strip() for a in row.xpath('text()') if a.strip() != '']
		print len(appliances)
		# print [a.strip() for a in appliances if a.strip() != '']

		# Get the numbers of each
		data = []
		patterns = ['([0-9]+) washer(s?) available', '([0-9]+) dryers available', '([0-9]+) people waiting']
		for pat in patterns:
			for text in availableTexts:
				matchObj = re.match(pat, text)
				if matchObj is not None:
					# Get the number out
					data.append(int(matchObj.group(1)))
					break
		print '{:d} washers available, {:d} dryers available, {:d} people waiting'.format(data[0], data[1], data[2])
		f.write(time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime()))
		f.write(',{:d},{:d},{:d}\n'.format(data[0], data[1], data[2]))
		f.flush()
		time.sleep(10)

