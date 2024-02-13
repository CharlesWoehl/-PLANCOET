Trestle.resource(:events) do
  menu do
    item :events, icon: "fa fa-calendar", label: "Agenda", badge: Event.pending_display_count
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :display, header: "Publié" do |resource|
      if resource.display
        "<i class='fas fa-check-circle text-success'></i>".html_safe
      else
        "<i class='fas fa-spinner fa-pulse text-warning'></i>".html_safe
      end
    end
    column :title, header:"Titre", sortable: false
    column :subtitle, header: "Sous-titre"
    column :start_date, header:"Date de début"
    column :end_date, header:"Date de fin"
    column :created_at, sortable: true, header: "Créé le"
    actions
  end

  form do |event|
    tab :infos, label: "Infos" do
      select :category_id, Category.all, label: "Catégorie"
      text_field :title, label: "Titre"
      text_field :subtitle, label: "Sous-titre"
      editor :content, label: "Contenu"
    end
    tab :dates, label: "Dates" do
      row do
        col { date_field :start_date }
        col { date_field :end_date }
      end
      row do
        col { time_field :hourly_start, label: "Heure de début" }
        col { time_field :hourly_end, label: "Heure de fin" }
      end
    end
    tab :contacts, label: "Contacts" do
      text_field :place, label: "Lieu"
      text_field :contact, label: "Contact"
      text_field :email, label: "Email"
      text_field :phone, label: "Téléphone"
      text_field :website, label: "Site internet"
    end
    tab :photo, label: "Photo" do
      file_field :photo, label: "Photo de l'événement"
      render "shared/media", model: event

    end
    tab :display, label: "Publication" do
      check_box :display, label: "Si la case est cochée, alors évènement publié"
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
  #   params.require(:event).permit(:name, ...)
  # end
end
