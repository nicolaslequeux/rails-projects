module ImageConcern

  extend ActiveSupport::Concern

  module ClassMethods

    def has_image(field, options = {})

      attr_accessor "#{field}_file".to_sym

      validates "#{field}_file".to_sym, file: {ext: [:jpg, :png]}

      after_save "#{field}_after_upload".to_sym
      before_save "#{field}_before_upload".to_sym
      after_destroy_commit "#{field}_destroy".to_sym

    end

  end


end
