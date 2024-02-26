Trestle.resource(:cities) do
  menu do
    item :cities, icon: "fa fa-city", label: "Ma ville pratique"
  end

  table do
    column :name
    actions
  end

  form do |city|
    tab :infos, label: "Infos" do
      select :category_id, Category.all, label: "Catégorie de l'association"

      text_field :name, label: "Nom du service ou de la structure"
      text_field :website, label: "Site internet avec HTTP ou HTTPS"
    end

    tab :photo, label: "Photo" do
      file_field :photo, label: "Photo"
      render "shared/media", model: city
    end
  end
  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:city).permit(:name, ...)
  # end
end
