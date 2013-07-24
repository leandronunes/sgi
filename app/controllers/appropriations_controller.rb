class AppropriationsController < ApplicationController
  # GET /appropriations
  # GET /appropriations.xml
  def index
    @appropriations = Appropriation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appropriations }
    end
  end

  # GET /appropriations/1
  # GET /appropriations/1.xml
  def show
    @appropriation = Appropriation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appropriation }
    end
  end

  # GET /appropriations/new
  # GET /appropriations/new.xml
  def new
    @appropriation = Appropriation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appropriation }
    end
  end

  # GET /appropriations/1/edit
  def edit
    @appropriation = Appropriation.find(params[:id])
  end

  # POST /appropriations
  # POST /appropriations.xml
  def create
    @appropriation = Appropriation.new(params[:appropriation])

    respond_to do |format|
      if @appropriation.save
        format.html { redirect_to(@appropriation, :notice => 'Appropriation was successfully created.') }
        format.xml  { render :xml => @appropriation, :status => :created, :location => @appropriation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @appropriation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /appropriations/1
  # PUT /appropriations/1.xml
  def update
    @appropriation = Appropriation.find(params[:id])

    respond_to do |format|
      if @appropriation.update_attributes(params[:appropriation])
        format.html { redirect_to(@appropriation, :notice => 'Appropriation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appropriation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appropriations/1
  # DELETE /appropriations/1.xml
  def destroy
    @appropriation = Appropriation.find(params[:id])
    @appropriation.destroy

    respond_to do |format|
      format.html { redirect_to(appropriations_url) }
      format.xml  { head :ok }
    end
  end
end
