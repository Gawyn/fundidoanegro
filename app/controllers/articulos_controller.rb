class ArticulosController < ApplicationController
  # GET /articulos
  # GET /articulos.xml
skip_before_filter :verify_authenticity_token 
	before_filter :authenticate_user!, :except => [:index, :show]
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :plugins => %w{ table fullscreen }
                            }
  def index
	@articulos = Articulo.find(:all, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articulos }
    end
  end

  # GET /articulos/1
  # GET /articulos/1.xml
  def show
    @articulo = Articulo.find(params[:id])
@articulosrelacionados1 = Array.new()
	if @articulo.especial!=nil
	@articulosrelacionados1 = Articulo.find(:all, :conditions => {:especial_id => @articulo.especial.id})
	@articulosrelacionados1.delete(@articulo)
	end
	@articulosrelacionados2 = Articulo.find(:all, :conditions => {:user_id => @articulo.user.id})
	@articulosrelacionados2.delete(@articulo)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @articulo }
    end
  end

  # GET /articulos/new
  # GET /articulos/new.xml
  def new
    @articulo = Articulo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @articulo }
    end
  end

  # GET /articulos/1/edit
  def edit
    @articulo = Articulo.find(params[:id])
  end

  # POST /articulos
  # POST /articulos.xml
  def create
	params[:articulo][:user_id] = current_user.id
    @articulo = Articulo.new(params[:articulo])

    respond_to do |format|
      if @articulo.save
        format.html { redirect_to(@articulo, :notice => 'Articulo was successfully created.') }
        format.xml  { render :xml => @articulo, :status => :created, :location => @articulo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @articulo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articulos/1
  # PUT /articulos/1.xml
  def update
    @articulo = Articulo.find(params[:id])

    respond_to do |format|
      if @articulo.update_attributes(params[:articulo])
        format.html { redirect_to(@articulo, :notice => 'Articulo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @articulo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.xml
  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy

    respond_to do |format|
      format.html { redirect_to(articulos_url) }
      format.xml  { head :ok }
    end
  end
end
