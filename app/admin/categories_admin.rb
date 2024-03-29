Trestle.resource(:categories) do
  menu do
    item :categories, icon: "fa fa-list"
  end

  table do
    column :name
  end
  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :color do |category|
      content_tag(:div, category.color, style: "background-color: #{category.color}; width: 100%; height: 100%;")
    end
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |category|
    text_field :name
    text_field :color
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:category).permit(:name, ...)
  # end
end
