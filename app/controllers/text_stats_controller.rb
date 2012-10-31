class TextStatsController < ApplicationController

  # GET /text_stats
  # GET /text_stats.json
  def index
    @text_stats = TextStat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @text_stats }
    end
  end

  # GET /text_stats/1
  # GET /text_stats/1.json
  def show
    @text_stat = TextStat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @text_stat }
    end

  end

  # GET /text_stats/new
  # GET /text_stats/new.json
  def new
    @text_stat = TextStat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @text_stat }
    end
  end

  # GET /text_stats/1/edit
  def edit
    @text_stat = TextStat.find(params[:id])
  end

  # POST /text_stats
  # POST /text_stats.json
  def create
    @text_stat = TextStat.new(params[:text_stat])

    respond_to do |format|
      if @text_stat.save
        format.html { redirect_to @text_stat, notice: 'Text stat was successfully created.' }
        format.json { render json: @text_stat, status: :created, location: @text_stat }
      else
        format.html { render action: "new" }
        format.json { render json: @text_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /text_stats/1
  # PUT /text_stats/1.json
  def update
    @text_stat = TextStat.find(params[:id])

    respond_to do |format|
      if @text_stat.update_attributes(params[:text_stat])
        format.html { redirect_to @text_stat, notice: 'Text stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @text_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_stats/1
  # DELETE /text_stats/1.json
  def destroy
    @text_stat = TextStat.find(params[:id])
    @text_stat.destroy

    respond_to do |format|
      format.html { redirect_to text_stats_url }
      format.json { head :no_content }
    end
  end
end
