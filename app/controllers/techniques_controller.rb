class TechniquesController < ApplicationController
  before_filter(:get_plugin)
  
  # GET /techniques
  # GET /techniques.xml
  def index
    @techniques = @plugin.techniques.order(sort_column(Technique) + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @techniques }
    end
  end

  # GET /techniques/1
  # GET /techniques/1.xml
  def show
    @technique = @plugin.techniques.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @technique }
    end
  end

  # GET /techniques/new
  # GET /techniques/new.xml
  def new

    template_id = params[:template_id]
    if not template_id.nil? and not template_id.blank?
      @technique_template = TechniqueTemplate.find(template_id)
    end

    @technique_template ||= TechniqueTemplate.new
    @technique_template.technique ||= Technique.new
    @technique = Technique.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @technique }
    end
  end

  # GET /techniques/1/edit
  def edit
    @technique = @plugin.techniques.find(params[:id])
    @technique_template ||= TechniqueTemplate.new
    @technique_template.technique = @technique
  end

  # POST /techniques
  # POST /techniques.xml
  def create
    @technique = @plugin.techniques.new(params[:technique])

    respond_to do |format|
      if @technique.save
        @plugin.update_attribute(:updated_at, Time.now)
        format.html { redirect_to(plugin_techniques_path(@plugin), :notice => 'Technique was successfully created.') }
        format.xml  { render :xml => @technique, :status => :created, :location => @technique }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @technique.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /techniques/1
  # PUT /techniques/1.xml
  def update
    @technique = @plugin.techniques.find(params[:id])

    respond_to do |format|
      if @technique.update_attributes(params[:technique])
        @plugin.update_attribute(:updated_at, Time.now)
        format.html { redirect_to(plugin_technique_path(@plugin, @technique), :notice => 'Technique was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @technique.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /techniques/1
  # DELETE /techniques/1.xml
  def destroy
    @technique = @plugin.techniques.find(params[:id])
    @technique.destroy

    respond_to do |format|
      format.html { redirect_to(plugin_techniques_url(@plugin)) }
      format.xml  { head :ok }
    end
  end

  def get_plugin
    @plugin = Plugin.find(params[:plugin_id])
  end
end
