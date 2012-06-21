class CatogariesController < ApplicationController
  # GET /catogaries
  # GET /catogaries.json
  def index
    @catogaries = Catogary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @catogaries }
    end
  end

  # GET /catogaries/1
  # GET /catogaries/1.json
  def show
    @catogary = Catogary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @catogary }
    end
  end

  # GET /catogaries/new
  # GET /catogaries/new.json
  def new
    @catogary = Catogary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @catogary }
    end
  end

  # GET /catogaries/1/edit
  def edit
    @catogary = Catogary.find(params[:id])
  end

  # POST /catogaries
  # POST /catogaries.json
  def create
    @catogary = Catogary.new(params[:catogary])

    respond_to do |format|
      if @catogary.save
        format.html { redirect_to @catogary, notice: 'Catogary was successfully created.' }
        format.json { render json: @catogary, status: :created, location: @catogary }
      else
        format.html { render action: "new" }
        format.json { render json: @catogary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /catogaries/1
  # PUT /catogaries/1.json
  def update
    @catogary = Catogary.find(params[:id])

    respond_to do |format|
      if @catogary.update_attributes(params[:catogary])
        format.html { redirect_to @catogary, notice: 'Catogary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @catogary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catogaries/1
  # DELETE /catogaries/1.json
  def destroy
    @catogary = Catogary.find(params[:id])
    @catogary.destroy

    respond_to do |format|
      format.html { redirect_to catogaries_url }
      format.json { head :no_content }
    end
  end
end
