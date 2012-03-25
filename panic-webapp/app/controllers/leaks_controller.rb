class LeaksController < ApplicationController
  # GET /leaks
  # GET /leaks.json
  def index
    @leaks = Leak.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leaks }
    end
  end

  # GET /leaks/1
  # GET /leaks/1.json
  def show
    @leak = Leak.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leak }
    end
  end

  # GET /leaks/new
  # GET /leaks/new.json
  def new
    @leak = Leak.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leak }
    end
  end

  # GET /leaks/1/edit
  def edit
    @leak = Leak.find(params[:id])
  end

  # POST /leaks
  # POST /leaks.json
  def create
    @leak = Leak.new(params[:leak])

    respond_to do |format|
      if @leak.save
        format.html { redirect_to @leak, notice: 'Leak was successfully created.' }
        format.json { render json: @leak, status: :created, location: @leak }
      else
        format.html { render action: "new" }
        format.json { render json: @leak.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leaks/1
  # PUT /leaks/1.json
  def update
    @leak = Leak.find(params[:id])

    respond_to do |format|
      if @leak.update_attributes(params[:leak])
        format.html { redirect_to @leak, notice: 'Leak was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @leak.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaks/1
  # DELETE /leaks/1.json
  def destroy
    @leak = Leak.find(params[:id])
    @leak.destroy

    respond_to do |format|
      format.html { redirect_to leaks_url }
      format.json { head :ok }
    end
  end
end
