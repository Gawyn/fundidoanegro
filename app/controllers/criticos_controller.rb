class CriticosController < ApplicationController
	before_filter :authenticate_admin!, :except => [:edit]
	before_filter :authenticate_critico!, :except => [:edit]
  # GET /users
  # GET /users.xml
  def index
    @criticos = Critico.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @criticos }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @critico = Critico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @criticos }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @critico = Criticos.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @criticos }
    end
  end

  # GET /users/1/edit
  def edit
    @critico = Critico.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @critico = Critico.new(params[:critico])
	@films = Film.all
	@films.each do |p|
		@puntuacion = Puntuacion.new(:film_id => p.id, :user_id => @critico.id, :nota => 0)
		@puntuacion.save
	end

    respond_to do |format|
      if @critico.save
        format.html { redirect_to(@critico, :notice => 'Critico was successfully created.') }
        format.xml  { render :xml => @critico, :status => :created, :location => @critico }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @critico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @critico = Critico.find(params[:id])

    respond_to do |format|
      if @critico.update_attributes(params[:critico])
        format.html { redirect_to(@critico, :notice => 'Critico was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @critico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @critico = Critico.find(params[:id])
    @critico.destroy

    respond_to do |format|
      format.html { redirect_to(criticos_url) }
      format.xml  { head :ok }
    end
  end
end
