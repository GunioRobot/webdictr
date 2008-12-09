class Dicts < Application
  # provides :xml, :yaml, :js

  def index
    @dicts = Dict.all
    display @dicts
  end

  def show(id)
    #@dict = Dict.get(id)
    @dict = Dict.first(:name => id)
    raise NotFound unless @dict
    display @dict
  end

  def new
    only_provides :html
    @dict = Dict.new
    display @dict
  end

  def edit(id)
    only_provides :html
    @dict = Dict.get(id)
    raise NotFound unless @dict
    display @dict
  end

  def create(dict)
    @dict = Dict.new(dict)
    if @dict.save
      redirect resource(@dict), :message => {:notice => "Dict was successfully created"}
    else
      message[:error] = "Dict failed to be created"
      render :new
    end
  end

  def update(id, dict)
    @dict = Dict.get(id)
    raise NotFound unless @dict
    if @dict.update_attributes(dict)
       redirect resource(@dict)
    else
      display @dict, :edit
    end
  end

  def destroy(id)
    @dict = Dict.get(id)
    raise NotFound unless @dict
    if @dict.destroy
      redirect resource(:dicts)
    else
      raise InternalServerError
    end
  end

end # Dicts
