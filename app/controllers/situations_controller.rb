class SituationsController < ApplicationController
  # GET /situations
  # GET /situations.xml
  def index
    @situations = Situation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @situations }
    end
  end

  # GET /situations/1
  # GET /situations/1.xml
  def show
    @situation = Situation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @situation }
    end
  end

  # GET /situations/new
  # GET /situations/new.xml
  def new
    @situation = Situation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @situation }
    end
  end

  # GET /situations/1/edit
  def edit
    @situation = Situation.find(params[:id])
  end

  # POST /situations
  # POST /situations.xml
  def create
    @situation = Situation.new(params[:situation])

    respond_to do |format|
      if @situation.save
        format.html { redirect_to(@situation, :notice => 'Situation was successfully created.') }
        format.xml  { render :xml => @situation, :status => :created, :location => @situation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @situation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /situations/1
  # PUT /situations/1.xml
  def update
    @situation = Situation.find(params[:id])

    respond_to do |format|
      if @situation.update_attributes(params[:situation])
        format.html { redirect_to(@situation, :notice => 'Situation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @situation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /situations/1
  # DELETE /situations/1.xml
  def destroy
    @situation = Situation.find(params[:id])
    @situation.destroy

    respond_to do |format|
      format.html { redirect_to(situations_url) }
      format.xml  { head :ok }
    end
  end
end
