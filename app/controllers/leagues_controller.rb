class LeaguesController < ApplicationController

  # GET /leagues
  def index
    @leagues = League.all

    render json: @leagues
  end

  # GET /leagues/1
  def show
    @league = League.find(params[:id])
    render json: @league
  end

  # POST /leagues
  def create
    @league = League.new(league_params)

    if @league.save
      logger.debug "League: #{@league.name}"
      render json: @league, status: :created, location: @league
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leagues/1
  def update
    @league = League.find(params[:id])

    if @league.update(league_params)
      render json: @league
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leagues/1
  def destroy
    @league = League.find(params[:id])

    @league.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def league_params
      params.require(:league).permit(:name, :permits_ties)
    end
end
