ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :cat_image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :cat_image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "category form" do
      f.input :name
      f.input :cat_image, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name
end
