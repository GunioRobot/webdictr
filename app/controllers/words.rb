class Words < Application
  # provides :xml, :yaml, :js

  def index
    @words = Word.all
    display @words
  end

  def show(id)
    @word = Word.get(id)
    raise NotFound unless @word
    display @word
  end

  def new
    only_provides :html
    @word = Word.new
    display @word
  end

  def edit(id)
    only_provides :html
    @word = Word.get(id)
    raise NotFound unless @word
    display @word
  end

  def create(word)
    @word = Word.new(word)
    if @word.save
      redirect resource(@word), :message => {:notice => "Word was successfully created"}
    else
      message[:error] = "Word failed to be created"
      render :new
    end
  end

  def update(id, word)
    @word = Word.get(id)
    raise NotFound unless @word
    if @word.update_attributes(word)
       redirect resource(@word)
    else
      display @word, :edit
    end
  end

  def destroy(id)
    @word = Word.get(id)
    raise NotFound unless @word
    if @word.destroy
      redirect resource(:words)
    else
      raise InternalServerError
    end
  end

end # Words
