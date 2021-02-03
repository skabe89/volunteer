module ErrorsHelper

  def full_error_messages(object)
    flash[:error] = object.errors.full_messages
  end

end