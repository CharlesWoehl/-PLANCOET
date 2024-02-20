class GeneralsController < ApplicationController
  def about
    @general = General.first # ou tout autre méthode pour récupérer l'élément 'general' approprié
  end

  def legal_notice
    @general = General.first # ou tout autre méthode pour récupérer l'élément 'general' approprié
  end
end
