class TemplateFieldsController < ApplicationController

  before_filter :check_ability, :except => [:index, :show]

  # GET /template_fields
  # GET /template_fields.xml
  def index
    @template_fields = TemplateField.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @template_fields }
    end
  end

  # GET /template_fields/1
  # GET /template_fields/1.xml
  def show
    @template_field = TemplateField.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @template_field }
    end
  end

  # GET /template_fields/new
  # GET /template_fields/new.xml
  def new
    @template_field = TemplateField.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @template_field }
    end
  end

  # GET /template_fields/1/edit
  def edit
    @template_field = TemplateField.find(params[:id])
  end

  # POST /template_fields
  # POST /template_fields.xml
  def create
    @template_field = TemplateField.new(params[:template_field])

    respond_to do |format|
      if @template_field.save

        #create new values for this template field_category
        values = params[:new_values] || []
        for value in values
          FieldValue.create(:value => value, :template_field_id => @template_field.id)
        end

        format.html { redirect_to(@template_field, :notice => 'Template field was successfully created.') }
        format.xml  { render :xml => @template_field, :status => :created, :location => @template_field }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @template_field.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /template_fields/1
  # PUT /template_fields/1.xml
  def update
    @template_field = TemplateField.find(params[:id])

    respond_to do |format|
      if @template_field.update_attributes(params[:template_field])
            values = params[:new_values] || []
            #check that old values are already selected
            #if not then destroy it
            @template_field.field_values.each{ |fv|
              fv.destroy unless values.include?(fv.value)
            } unless @template_field.field_values.nil?

            #create new values for this template field_category
            for value in values
              FieldValue.create(:value => value, :template_field_id => @template_field.id)
            end

        format.html { redirect_to(@template_field, :notice => 'Template field was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @template_field.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /template_fields/1
  # DELETE /template_fields/1.xml
  def destroy
    @template_field = TemplateField.find(params[:id])
    @template_field.destroy

    respond_to do |format|
      format.html { redirect_to(template_fields_url) }
      format.xml  { head :ok }
    end
  end

end

