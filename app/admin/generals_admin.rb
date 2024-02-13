Trestle.resource(:generals) do
  menu do
    item :generals, icon: "fa fa-home", label: "Page d'accueil"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :title
   end

  # Customize the form fields shown on the new/edit views.
  #
  form do |general|
    tab :ACCUEIL do
      text_field :title, label: "Titre de la page d'accueil"
      text_area :subtitle, label: "Sous-titre de la page d'accueil"
    end
    tab :photo_accueil do
      file_field :photo, accept: "image/*"
      render "shared/media", model: general

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
  #   params.require(:general).permit(:name, ...)
  # end
end
