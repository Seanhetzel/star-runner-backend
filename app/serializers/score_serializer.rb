class ScoreSerializer < ActiveModel::Serializer
  def initialize(score_object)
    @score = score_object
  end

  def to_serialized_json
      options = {
        except: [:updated_at, :created_at]
      }
      @score.to_json(options)
  end
