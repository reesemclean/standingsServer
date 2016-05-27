class TeamsController < ApplicationController

  # GET /leagues/:league_id/teams
  def index
    @teams = Team.where(league_id: params[:league_id])

    render json: @teams
  end

  # GET /teams/1
  def show
    @team = Team.find(params[:id])
    render json: @team
  end

  # POST /leagues/:league_id/teams
  def create
    @team = Team.new(team_params)
    @team.league_id = params[:league_id]

    if @team.save
      render json: @team, status: :created, location: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team = Team.find(params[:id])

    @team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:name, :league_id)
    end
end
