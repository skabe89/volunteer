module ErrorsHelper

  def full_error_messages(object)
    flash.now[:error] = object.errors.full_messages
  end

end