class ResultsController < ApplicationController

  # GET /leagues/:league_id/results
  def index
    @results = Result.where(league_id: params[:league_id])
    render json: @results
  end

  # GET /results/1
  def show
    @result = Result.find(params[:id])

    render json: @result
  end

  # POST /leagues/:league_id/results
  def create

    @result = Result.new
    @result.league_id = params["league_id"]
    @result.date = params["result"]["date"]

    winning_team_ids = params["result"]["winning_team_ids"]
    losing_team_ids = params["result"]["losing_team_ids"]
    tied_team_ids = params["result"]["tied_team_ids"]

    winning_participants = winning_team_ids.map { |id|
      participant = ResultParticipant.new
      participant.status = :won
      participant.team_id = id
      participant.result = @result
      participant
    }

    losing_participants = losing_team_ids.map { |id|
      participant = ResultParticipant.new
      participant.status = :lost
      participant.team_id = id
      participant.result = @result
      participant
    }

    tied_participants = tied_team_ids.map { |id|
      participant = ResultParticipant.new
      participant.status = :tied
      participant.team_id = id
      participant.result = @result
      participant
    }

    participants_to_save = winning_participants + losing_participants + tied_participants

    Result.transaction do
      logger.debug "About to save result"
      unless @result.save
        logger.debug "Result save failed"
        raise ActiveRecord::Rollback
        render json: @result.errors, status: :unprocessable_entity and return
      end

      participants_to_save.each { |participant|
        unless participant.save
          raise ActiveRecord::Rollback
          render json: participant.errors, status: :unprocessable_entity and return
        end
      }

      render json: @result, status: :created, location: @result
    end

  end

  # DELETE /results/1
  def destroy
    @result = Result.find(params[:id])

    @result.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def result_params
      params.require(:result).permit(:league_id, :winning_team_ids, :losing_team_ids, :tied_team_ids, :date)
    end
end
