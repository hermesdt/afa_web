class TechniqueTemplatesController < ApplicationController

  before_filter :check_ability, :except => [:index, :show]

  # GET /technique_templates
  # GET /technique_templates.xml
  def index
    @technique_templates = TechniqueTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @technique_templates }
    end
  end

  # GET /technique_templates/1
  # GET /technique_templates/1.xml
  def show
    @technique_template = TechniqueTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @technique_template }
    end
  end

  # GET /technique_templates/new
  # GET /technique_templates/new.xml
  def new
    @technique_template = TechniqueTemplate.new
    @technique = Technique.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @technique_template }
    end
  end

  # GET /technique_templates/1/edit
  def edit
    @technique_template = TechniqueTemplate.find(params[:id])
    @technique = @technique_template.technique
  end

  # POST /technique_templates
  # POST /technique_templates.xml
  def create
    @technique_template = TechniqueTemplate.new(params[:technique_template])
    @technique = Technique.new(params[:technique])
    @technique_template.technique = @technique

    respond_to do |format|
      if @technique_template.save && @technique.save
        format.html { redirect_to(@technique_template, :notice => 'Technique template was successfully created.') }
        format.xml  { render :xml => @technique_template, :status => :created, :location => @technique_template }
      else
        @technique.destroy if @technique.errors.count == 0
        @technique_template.destroy if @technique_template.errors.count == 0
        format.html { render :action => "new" }
        format.xml  { render :xml => @technique_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /technique_templates/1
  # PUT /technique_templates/1.xml
  def update
    @technique_template = TechniqueTemplate.find(params[:id])
    @technique = @technique_template.technique

    respond_to do |format|
      if @technique_template.update_attributes(params[:technique_template]) and
        @technique.update_attributes(params[:technique])
        format.html { redirect_to(@technique_template, :notice => 'Technique template was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @technique_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /technique_templates/1
  # DELETE /technique_templates/1.xml
  def destroy
    @technique_template = TechniqueTemplate.find(params[:id])
    @technique_template.technique.destroy
    @technique_template.destroy

    respond_to do |format|
      format.html { redirect_to(technique_templates_url) }
      format.xml  { head :ok }
    end
  end

  def add_field_to_template
    @template_field = TemplateField.find(params[:id])

    respond_to do |format|
      format.js
    end
  end
end

