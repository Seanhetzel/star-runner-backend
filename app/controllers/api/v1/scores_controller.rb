class Api::V1::ScoresController < ApplicationController
    def index 
        scores = Score.all 
        render json: ScoreSerializer.new(scores).to_serialized_json
    end

    def create
        if Score.exists?(display_name: params[:display_name])
            score = Score.find(params[:id])
            score.update(score_params)
            render json: score_params
        else
            score = Score.new(score_params)
            if score.save!
                render json: score_params
            else
                render :new 
            end
        end
    end

    private 

    def score_params
        params.require(:score).permit(:id, :high_score, :display_name)
    end
end
