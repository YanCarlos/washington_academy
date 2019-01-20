module LinksHelper
  def link_to_delete_helper resource, message
    link_to(
      content_tag(:i, '', class:'fa fa-trash'), 
      resource, 
      method: :delete, 
      data: {
        confirm: message, 
        title: 'Deleting...', 
        commit: 'Delete',
        cancel: 'Cancel'}, 
      class: 'btn btn-sm btn-actions'
    )
  end

  def link_to_logout_helper 
    link_to('Sign out',
      destroy_user_session_path , class: 'nav-link', 
      method: :delete, 
      data: {
        confirm: 'Do you want to log out?', 
        title: 'Sign Out', 
        commit: 'Yes, i do', 
        cancel: 'No'}
    )
  end

end
