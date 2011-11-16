class Stock < ActiveRecord::Base


validates_presence_of :symbol
 
 def validate
	errors.add(:symbol, "Must be a valid Ticker Symbol") if date.nil?|| date == "invalid date"
  end


  def Stock::getStock(ticker)
	# Special Characters:d1=date,t1=Last Trade Time, s=Symbol, n=Name, g=Day's Low, l1=Last Trade (Price Only), p2=Percent Change, h=Day's High, x=Stock Exchange (ref:http://www.gummy-stuff.org/Yahoo-data.htm)
        Net::HTTP.get('download.finance.yahoo.com','/d?f=d1t1sngl1hx&s='+ ticker);
  end

  def self.search(search)
    if search
      find(:all, :conditions =>['symbol LIKE ?', "%#{search}%"], :limit => 5, :order => 'date DESC, time DESC')
    else
      find(:all, :order => 'date DESC, time DESC')
    end
  end


end
