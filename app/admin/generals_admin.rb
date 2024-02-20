Trestle.resource(:generals) do
  menu do
    item :generals, icon: "fa fa-home", label: "Infos générales du site"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :title
   end

  # Customize the form fields shown on the new/edit views.
  #
  form do |general|
    tab :homepage do
      text_field :title, label: "Titre de la page d'accueil"
      text_area :subtitle, label: "Sous-titre de la page d'accueil"
      file_field :photo, accept: "image/*"
      render "shared/media", model: general
    end
    tab :mentions_légales do
      editor :legal_notice, label: "Mentions légales", rows: 5

    end
    tab :À_propos do
      editor :about, label: "À propos", rows: 5
      file_field :photo_about, accept: "image/*"
      render "shared/media_about", model: general

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
