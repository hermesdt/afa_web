class PluginsController < ApplicationController

  # GET /plugins
  # GET /plugins.xml
  def index
    @plugins = Plugin.order(sort_column(Plugin) + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :layaout => false }
    end
  end


  # GET /plugins/1
  # GET /plugins/1.xml
  def show
    @plugin = Plugin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :layaout => false }
    end
  end

  # GET /plugins/new
  # GET /plugins/new.xml
  def new
    @plugin = Plugin.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plugin }
    end
  end

  # GET /plugins/1/edit
  def edit
    @plugin = Plugin.find(params[:id])
  end

  # POST /plugins
  # POST /plugins.xml
  def create
    @plugin = Plugin.new(params[:plugin])

    respond_to do |format|
      if @plugin.save
        flash[:notice] = 'Plugin was successfully created.'
        format.html { redirect_to(@plugin) }
        format.xml  { render :xml => @plugin, :status => :created, :location => @plugin }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plugin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plugins/1
  # PUT /plugins/1.xml
  def update
    @plugin = Plugin.find(params[:id])

    if params[:tag_ids].nil?
      @plugin.tags = [] if params[:tag_ids].nil?
      @plugin.updated_at = Time.now
      @plugin.save
    end

    #necesario para comprobar y tratar si se ha seleccionado
    #varias veces el mismo tag. en caso afirmativo salta
    #excepcion
    resul = false
    begin
      resul = @plugin.update_attributes(params[:plugin])
    rescue Exception => e
      @plugin.errors.add ' ', e.to_s
    end

    respond_to do |format|
      if resul
        format.html { redirect_to(@plugin, :notice => 'Plugin was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plugin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plugins/1
  # DELETE /plugins/1.xml
  def destroy
    @plugin = Plugin.find(params[:id])
    @plugin.destroy

    respond_to do |format|
      format.html { redirect_to(plugins_url) }
      format.xml  { head :ok }
    end
  end

  def add_tag
    @tag = Tag.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def news
    respond_to do |format|
      format.html
    end
  end
end

