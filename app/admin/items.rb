ActiveAdmin.register Item do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :display_name, :item_explain, :price, :image, :itemname, :quantity, :reviews_count

  member_action :publish, method: :put do
    item = Item.find(params[:id])
    item.update(published_at: Time.zone.now)
    redirect_to admin_item_path(item)
  end

  action_item :publish, only: :show do
    link_to "publish", publish_admin_post_path(post), method: :put unless item.published_at?
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :display_name, :item_explain, :price, :image, :itemname, :quantity, :reviews_count]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
