class PostDecorator < ApplicationDecorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end
  
  def published_at
    self.l(created_at, format: "%A, %B %e")
  end

  def edit_if_author
    if h.current_user == model.user
      h.link_to(h.t(:edit), "/#{I18n.locale}/posts/#{self.id}/edit", class:"btn btn-primary", style:"margin-left:15px;")
    end
  end

  def delete_if_author
    if h.current_user == model.user
      h.button_to(h.t(:delete), @post, method: :delete, data: {confirm: "Are you sure?"}, class:"btn btn-primary", style:"position:relative; left:145px; bottom:38px;")
    end
  end


end
 

