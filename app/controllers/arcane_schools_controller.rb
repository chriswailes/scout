class ArcaneSchoolsController < ApplicationController
  # GET /arcane_schools
  # GET /arcane_schools.json
  def index
    @arcane_schools = ArcaneSchool.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @arcane_schools }
    end
  end

  # GET /arcane_schools/1
  # GET /arcane_schools/1.json
  def show
    @arcane_school = ArcaneSchool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @arcane_school }
    end
  end

  # GET /arcane_schools/new
  # GET /arcane_schools/new.json
  def new
    @arcane_school = ArcaneSchool.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @arcane_school }
    end
  end

  # GET /arcane_schools/1/edit
  def edit
    @arcane_school = ArcaneSchool.find(params[:id])
  end

  # POST /arcane_schools
  # POST /arcane_schools.json
  def create
    @arcane_school = ArcaneSchool.new(params[:arcane_school])

    respond_to do |format|
      if @arcane_school.save
        format.html { redirect_to @arcane_school, notice: 'Arcane school was successfully created.' }
        format.json { render json: @arcane_school, status: :created, location: @arcane_school }
      else
        format.html { render action: "new" }
        format.json { render json: @arcane_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /arcane_schools/1
  # PUT /arcane_schools/1.json
  def update
    @arcane_school = ArcaneSchool.find(params[:id])

    respond_to do |format|
      if @arcane_school.update_attributes(params[:arcane_school])
        format.html { redirect_to @arcane_school, notice: 'Arcane school was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @arcane_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arcane_schools/1
  # DELETE /arcane_schools/1.json
  def destroy
    @arcane_school = ArcaneSchool.find(params[:id])
    @arcane_school.destroy

    respond_to do |format|
      format.html { redirect_to arcane_schools_url }
      format.json { head :no_content }
    end
  end
end
