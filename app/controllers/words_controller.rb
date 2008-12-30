class WordsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  # GET /words
  # GET /words.xml
  def index
    @words = nil
    query = params[:q].strip.downcase[0..50]
    if params[:q]
      @words = Word.search query, :field_weights => {:keyword => 20, :definition => 1}
      unless @words.empty?
        @words = @words.slice(0,1) if  @words[0].keyword == query
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @words }
    end
  end

  # GET /words/1
  # GET /words/1.xml
  def show
    argument = params[:id].to_i
    if argument == 0 # find by keyword
      @word = Word.find_by_keyword(params[:id])
    else # find by keyword id
      @word = Word.find(argument)
    end
    if @word
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @word }
      end
    else
      redirect_to :words
    end
  end

  # GET /words/new
  # GET /words/new.xml
  def new
    @word = Word.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @word }
    end
  end

  # GET /words/1/edit
  def edit
    @word = Word.find(params[:id])
  end

  # POST /words
  # POST /words.xml
  def create
    @word = Word.new(params[:word])

    respond_to do |format|
      if @word.save
        flash[:notice] = 'Word was successfully created.'
        format.html { redirect_to(@word) }
        format.xml  { render :xml => @word, :status => :created, :location => @word }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /words/1
  # PUT /words/1.xml
  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        flash[:notice] = 'Word was successfully updated.'
        format.html { redirect_to(@word) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.xml
  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    respond_to do |format|
      format.html { redirect_to(words_url) }
      format.xml  { head :ok }
    end
  end
end
