class DictsController < ApplicationController
  # GET /dicts
  # GET /dicts.xml
  def index
    @dicts = Dict.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dicts }
    end
  end

  # GET /dicts/1
  # GET /dicts/1.xml
  def show
    @dict = Dict.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dict }
    end
  end

  # GET /dicts/new
  # GET /dicts/new.xml
  def new
    @dict = Dict.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dict }
    end
  end

  # GET /dicts/1/edit
  def edit
    @dict = Dict.find(params[:id])
  end

  # POST /dicts
  # POST /dicts.xml
  def create
    @dict = Dict.new(params[:dict])

    respond_to do |format|
      if @dict.save
        flash[:notice] = 'Dict was successfully created.'
        format.html { redirect_to(@dict) }
        format.xml  { render :xml => @dict, :status => :created, :location => @dict }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dict.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dicts/1
  # PUT /dicts/1.xml
  def update
    @dict = Dict.find(params[:id])

    respond_to do |format|
      if @dict.update_attributes(params[:dict])
        flash[:notice] = 'Dict was successfully updated.'
        format.html { redirect_to(@dict) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dict.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dicts/1
  # DELETE /dicts/1.xml
  def destroy
    @dict = Dict.find(params[:id])
    @dict.destroy

    respond_to do |format|
      format.html { redirect_to(dicts_url) }
      format.xml  { head :ok }
    end
  end
end
