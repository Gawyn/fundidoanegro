class CriticasController < ApplicationController
  # GET /criticas
  # GET /criticas.xml
  def index
    @criticas = Critica.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @criticas }
    end
  end

  # GET /criticas/1
  # GET /criticas/1.xml
  def show
    @critica = Critica.find(params[:id])

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
