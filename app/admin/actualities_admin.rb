Trestle.resource(:actualities) do
  menu do
    item :actualities, icon: "fa fa-rss", label:"Actualités"
  end

  table do
    column :activate, align: :center, header: "Statut"
    column :date, header: "Date de parution"
    column :title, header: "Titre" do |actuality|
      "#{actuality.title}"
    end
     column :category, header: "Catégorie"
    actions
  end

  form do |actuality|
    tab :actuality, label: "Actualité" do
      text_field :title, label: "Titre"
      text_field :short_description, label: "Description courte"
      select :category_id, Category.all, label: "Catégorie"
      editor :content, label: "Contenu"
    end
    tab :photo, label: "Photo" do
      file_field :photo
      render "shared/media", model: actuality
    end
    tab :date, label: "Date de parution" do
      date_field :date, label: "Date de parution", class: "datepicker col-2"
      check_box :activate, label: "Activer l'actualité"
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
  #   params.require(:actuality).permit(:name, ...)
  # end
end
