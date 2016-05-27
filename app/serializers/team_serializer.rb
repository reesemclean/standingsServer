class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :results_summary

  def results_summary
    win_count, loss_count, tie_count = object.result_summary
    return {
      win_count: win_count,
      loss_count: loss_count,
      tie_count: tie_count
    }
  end

end
