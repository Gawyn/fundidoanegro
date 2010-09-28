class EspecialsController < ApplicationController
  # GET /especials
  # GET /especials.xml
	before_filter :authenticate_user!, :except => [:index, :show]
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :plugins => %w{ table fullscreen }
                            }
  def index
    @especials = Especial.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especials }
    end
  end

  # GET /especials/1
  # GET /especials/1.xml
  def show
    @especial = Especial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @especial }
    end
  end

  # GET /especials/new
  # GET /especials/new.xml
  def new
    @especial = Especial.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @especial }
    end
  end

  # GET /especials/1/edit
  def edit
    @especial = Especial.find(params[:id])
  end

  # POST /especials
  # POST /especials.xml
  def create
    @especial = Especial.new(params[:especial])

    respond_to do |format|
      if @especial.save
        format.html { redirect_to(@especial, :notice => 'Especial was successfully created.') }
        format.xml  { render :xml => @especial, :status => :created, :location => @especial }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @especial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /especials/1
  # PUT /especials/1.xml
  def update
    @especial = Especial.find(params[:id])

    respond_to do |format|
      if @especial.update_attributes(params[:especial])
        format.html { redirect_to(@especial, :notice => 'Especial was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @especial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /especials/1
  # DELETE /especials/1.xml
  def destroy
    @especial = Especial.find(params[:id])
    @especial.destroy

    respond_to do |format|
      format.html { redirect_to(especials_url) }
      format.xml  { head :ok }
    end
  end
end
