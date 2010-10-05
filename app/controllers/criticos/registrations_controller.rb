class Criticos::RegistrationsController < ApplicationController
  include Devise::Controllers::InternalHelpers
	before_filter :authenticate_admin!, :except => [:sign_in,:edit]
	before_filter :authenticate_critico!, :except => [:sign_in]

  # POST /resource/sign_up
  def create
	@films = Film.all
    @critico = Critico.new(params[:critico])

    respond_to do |format|
      if @critico.save
        format.html { redirect_to(@critico, :notice => 'Film was successfully created.') }
        format.xml  { render :xml => @critico, :status => :created, :location => @critico }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @critico.errors, :status => :unprocessable_entity }
      end
    end
	@films.each do |p|
		@puntuacion = Puntuacion.new(:film_id => p.id, :critico_id => @critico.id, :nota => 0)
		@puntuacion.save
	end
  end


  # GET /resource/sign_up
  def new
    @critico = Critico.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @criticos }
    end
  end

  def show
    @critico = Critico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @critico = Critico.find(params[:id])
  end



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
