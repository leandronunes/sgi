class SsTypesController < ApplicationController
  # GET /ss_types
  # GET /ss_types.xml
  def index
    @ss_types = SsType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ss_types }
    end
  end

  # GET /ss_types/1
  # GET /ss_types/1.xml
  def show
    @ss_type = SsType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ss_type }
    end
  end

  # GET /ss_types/new
  # GET /ss_types/new.xml
  def new
    @ss_type = SsType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ss_type }
    end
  end

  # GET /ss_types/1/edit
  def edit
    @ss_type = SsType.find(params[:id])
  end

  # POST /ss_types
  # POST /ss_types.xml
  def create
    @ss_type = SsType.new(params[:ss_type])

    respond_to do |format|
      if @ss_type.save
        format.html { redirect_to(@ss_type, :notice => 'Ss type was successfully created.') }
        format.xml  { render :xml => @ss_type, :status => :created, :location => @ss_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ss_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ss_types/1
  # PUT /ss_types/1.xml
  def update
    @ss_type = SsType.find(params[:id])

    respond_to do |format|
      if @ss_type.update_attributes(params[:ss_type])
        format.html { redirect_to(@ss_type, :notice => 'Ss type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ss_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ss_types/1
  # DELETE /ss_types/1.xml
  def destroy
    @ss_type = SsType.find(params[:id])
    @ss_type.destroy

    respond_to do |format|
      format.html { redirect_to(ss_types_url) }
      format.xml  { head :ok }
    end
  end
end
