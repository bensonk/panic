class CredentialsController < ApplicationController
  # GET /credentials
  # GET /credentials.json
  def index
    @credentials = Credential.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @credentials }
    end
  end

  # GET /credentials/1
  # GET /credentials/1.json
  def show
    @credential = Credential.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @credential }
    end
  end

  # GET /credentials/new
  # GET /credentials/new.json
  def new
    @credential = Credential.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @credential }
    end
  end

  # GET /credentials/1/edit
  def edit
    @credential = Credential.find(params[:id])
  end

  # POST /credentials
  # POST /credentials.json
  def create
    @credential = Credential.new(params[:credential])

    respond_to do |format|
      if @credential.save
        format.html { redirect_to @credential, notice: 'Credential was successfully created.' }
        format.json { render json: @credential, status: :created, location: @credential }
      else
        format.html { render action: "new" }
        format.json { render json: @credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /credentials/1
  # PUT /credentials/1.json
  def update
    @credential = Credential.find(params[:id])

    respond_to do |format|
      if @credential.update_attributes(params[:credential])
        format.html { redirect_to @credential, notice: 'Credential was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credentials/1
  # DELETE /credentials/1.json
  def destroy
    @credential = Credential.find(params[:id])
    @credential.destroy

    respond_to do |format|
      format.html { redirect_to credentials_url }
      format.json { head :ok }
    end
  end
end
