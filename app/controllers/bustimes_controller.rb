class BustimesController < ApplicationController
  # GET /bustimes
  # GET /bustimes.json
  require 'nokogiri'
  require 'open-uri'
  require 'active_support/core_ext/hash/conversions'
  before_filter :getKey
  def index
    @bustimes = Bustime.all


   @hey = Date.today.to_s.tr("-", "") 
   @time = Time.now.strftime("%H:%M").to_s.tr(":", "")


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bustimes }
    end
  end

  # GET /bustimes/1
  # GET /bustimes/1.json
  def show
    @bustime = Bustime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bustime }
    end
  end

  # GET /bustimes/new
  # GET /bustimes/new.json
  def new
    @bustime = Bustime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bustime }
    end
  end

  # GET /bustimes/1/edit
  def edit
    @bustime = Bustime.find(params[:id])
  end

  # POST /bustimes
  # POST /bustimes.json
  def create
    @bustime = Bustime.new(params[:bustime])

    respond_to do |format|
      if @bustime.save
        format.html { redirect_to @bustime, notice: 'Bustime was successfully created.' }
        format.json { render json: @bustime, status: :created, location: @bustime }
      else
        format.html { render action: "new" }
        format.json { render json: @bustime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bustimes/1
  # PUT /bustimes/1.json
  def update
    @bustime = Bustime.find(params[:id])

    respond_to do |format|
      if @bustime.update_attributes(params[:bustime])
        format.html { redirect_to @bustime, notice: 'Bustime was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bustime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bustimes/1
  # DELETE /bustimes/1.json
  def destroy
    @bustime = Bustime.find(params[:id])
    @bustime.destroy

    respond_to do |format|
      format.html { redirect_to bustimes_url }
      format.json { head :no_content }
    end
  end

  def busload
    @bustimes = Bustime.all
    render :layout => false
  end

  private
    def getKey
    @key = Setting.find_by_name('apikey')
  end
  
end
