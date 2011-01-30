class CriticasController < ApplicationController
  # GET /criticas
  # GET /criticas.xml
skip_before_filter :verify_authenticity_token 
	before_filter :authenticate_user!, :except => [:index, :show]
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :plugins => %w{ table fullscreen }
                            }
  def index
	@criticas = Critica.find(:all, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @criticas }
    end
  end

  # GET /criticas/1
  # GET /criticas/1.xml
  def show
    @critica = Critica.find(params[:id])
@criticasrelacionadas1 = Array.new()
if @critica.especial!=nil
@criticasrelacionadas1 = Critica.find(:all, :conditions => {:especial_id => @critica.especial.id})
@criticasrelacionadas1.delete(@critica)
end
@criticasrelacionadas2 = Critica.find(:all, :conditions => {:user_id => @critica.user.id})
@criticasrelacionadas2.delete(@critica)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @critica }
    end
  end

  # GET /criticas/new
  # GET /criticas/new.xml
  def new
    @critica = Critica.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @critica }
    end
  end

  # GET /criticas/1/edit
  def edit
    @critica = Critica.find(params[:id])
  end

  # POST /criticas
  # POST /criticas.xml
  def create
	params[:critica][:user_id] = current_user.id
    @critica = Critica.new(params[:critica])
    respond_to do |format|
      if @critica.save
        format.html { redirect_to(@critica, :notice => 'Critica was successfully created.') }
        format.xml  { render :xml => @critica, :status => :created, :location => @critica }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @critica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /criticas/1
  # PUT /criticas/1.xml
  def update
    @critica = Critica.find(params[:id])

    respond_to do |format|
      if @critica.update_attributes(params[:critica])
        format.html { redirect_to(@critica, :notice => 'Critica was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @critica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /criticas/1
  # DELETE /criticas/1.xml
  def destroy
    @critica = Critica.find(params[:id])
    @critica.destroy

    respond_to do |format|
      format.html { redirect_to(criticas_url) }
      format.xml  { head :ok }
    end
  end
end
