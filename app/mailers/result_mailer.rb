class ResultMailer < ApplicationMailer
  def result_email(teams)
    @teams = teams.find_all { |team| team.email.blank? == false }
    emails = @teams.collect(&:email).join(",")
    mail(:to => emails, :subject => "SkorBoard: A New Result has been Recorded")
  end
end
