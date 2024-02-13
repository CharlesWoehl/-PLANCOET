Trestle.resource(:associations) do
  menu do
    item :associations, icon: "fa fa-hand-holding-heart"
  end

  table do
    column :name
  end

  form do |association|
    tab :infos, label: "Infos" do
      select :category_id, Category.all, label: "Catégorie de l'association"
      text_field :name, label: "Nom de l'association"
      text_field :short_description, label: "Description courte de l'association"
      text_field :address, label: "Lieu d'activité de l'association"
      editor :resume, label: "Résumé de l'association", rows: 5
    end

    tab :contacts, label: "Contacts" do
      render "president"

      row do
        col { text_field :president, label: "Nom" }
        col { text_field :phone_president, label: "Téléphone" }
      end
      text_field :mail_president, label: "Email"
      render "referent"

      row do
        col { text_field :referent, label: "Nom" }
        col { text_field :phone_referent, label: "Téléphone" }
      end
      row do
        col { text_field :mail_referent, label: "Email" }
      end
      render "reseaux"
      text_field :website, label: "Site web"
      row do
        col {text_field :facebook, label: "Facebook"}
        col {text_field :instagram, label: "Instagram"}
      end
    end

    tab :photo, label: "Photo" do
      file_field :photo, label: "Photo de l'association"
      render "shared/media", model: association

    end

  end
end
