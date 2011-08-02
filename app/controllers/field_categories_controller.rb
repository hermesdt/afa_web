class FieldCategoriesController < ApplicationController
  # GET /field_categories
  # GET /field_categories.xml
  def index
    @field_categories = FieldCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @field_categories }
    end
  end

  # GET /field_categories/1
  # GET /field_categories/1.xml
  def show
    @field_category = FieldCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @field_category }
    end
  end

  # GET /field_categories/new
  # GET /field_categories/new.xml
  def new
    @field_category = FieldCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @field_category }
    end
  end

  # GET /field_categories/1/edit
  def edit
    @field_category = FieldCategory.find(params[:id])
  end

  # POST /field_categories
  # POST /field_categories.xml
  def create
    @field_category = FieldCategory.new(params[:field_category])

    respond_to do |format|
      if @field_category.save
        format.html { redirect_to(@field_category, :notice => 'Field category was successfully created.') }
        format.xml  { render :xml => @field_category, :status => :created, :location => @field_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @field_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /field_categories/1
  # PUT /field_categories/1.xml
  def update
    @field_category = FieldCategory.find(params[:id])

    respond_to do |format|
      if @field_category.update_attributes(params[:field_category])
        format.html { redirect_to(@field_category, :notice => 'Field category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @field_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /field_categories/1
  # DELETE /field_categories/1.xml
  def destroy
    @field_category = FieldCategory.find(params[:id])
    @field_category.destroy

    respond_to do |format|
      format.html { redirect_to(field_categories_url) }
      format.xml  { head :ok }
    end
  end
end
