class TimeTypesController < ApplicationController
  # GET /time_types
  # GET /time_types.xml
  def index
    @time_types = TimeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @time_types }
    end
  end

  # GET /time_types/1
  # GET /time_types/1.xml
  def show
    @time_type = TimeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @time_type }
    end
  end

  # GET /time_types/new
  # GET /time_types/new.xml
  def new
    @time_type = TimeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @time_type }
    end
  end

  # GET /time_types/1/edit
  def edit
    @time_type = TimeType.find(params[:id])
  end

  # POST /time_types
  # POST /time_types.xml
  def create
    @time_type = TimeType.new(params[:time_type])

    respond_to do |format|
      if @time_type.save
        format.html { redirect_to(@time_type, :notice => 'Time type was successfully created.') }
        format.xml  { render :xml => @time_type, :status => :created, :location => @time_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @time_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /time_types/1
  # PUT /time_types/1.xml
  def update
    @time_type = TimeType.find(params[:id])

    respond_to do |format|
      if @time_type.update_attributes(params[:time_type])
        format.html { redirect_to(@time_type, :notice => 'Time type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @time_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /time_types/1
  # DELETE /time_types/1.xml
  def destroy
    @time_type = TimeType.find(params[:id])
    @time_type.destroy

    respond_to do |format|
      format.html { redirect_to(time_types_url) }
      format.xml  { head :ok }
    end
  end
end
