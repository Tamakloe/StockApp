class StocksController < ApplicationController
  # GET /stocks
  # GET /stocks.xml
  def index
    @stocks = Stock.search(params[:search])# Stock.find by parameters

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stocks }
    end
  end

  # GET /stocks/1
  # GET /stocks/1.xml
  def show
    @stock = Stock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stock }
    end
  end


  # GET /stocks/new
  # GET /stocks/new.xml
  def new
	@stock = Stock.new    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stock }
    end
  end



  # GET /stocks/1/edit
  def edit
    @stock = Stock.find(params[:id])
  end

  # POST /stocks
  # POST /stocks.xml


  def create

	@stock = Stock.new(params[:stock])
	
	$fullstock = Stock::getStock(@stock.symbol)

	$s = $fullstock.split(/[,\r\n]+/)


    @stock.date = Date.parse($s[0])
rescue Exception
	ArgumentError 
ensure

    @stock.time = $s[1]
#Time.parse($s[1])

    @stock.symbol = $s[2]
    @stock.name = $s[3]
    @stock.low = $s[4]
    @stock.current = $s[5]
    @stock.high = $s[6]
    @stock.exchange = $s[7]

    respond_to do |format|
      if @stock.save
        format.html { redirect_to(@stock, :notice => 'Your Requested Stock details for ' + @stock.symbol + ' are.') }
        format.xml  { render :xml => @stock, :status => :created, :location => @stock }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stock.errors, :status => :unprocessable_entity }
      end
    end


  end

  # PUT /stocks/1
  # PUT /stocks/1.xml
  def update
    @stock = Stock.find(params[:id])

    respond_to do |format|
      if @stock.update_attributes(params[:stock])
        format.html { redirect_to(@stock, :notice => 'Stock was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stock.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.xml
  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to(stocks_url) }
      format.xml  { head :ok }
    end
  end
end
