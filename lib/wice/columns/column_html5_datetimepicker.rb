module Wice
  module Columns #:nodoc:
    class ViewColumnHtml5Datetimepicker < ViewColumn #:nodoc:

      include Wice::Columns::CommonDateDatetimeMixin
      include Wice::Columns::CommonJsDateDatetimeMixin

      def do_render(params) #:nodoc:
        css_class = 'form-control input-sm native-datetimepicker ' + (auto_reload ? 'auto-reload' : '')
        date_format = Wice::ConfigurationProvider.value_for(:DATETIME_FORMAT)
        '<div class="date-filter wg-html5-datetimepicker"><div>' +
          datetime_field_tag(@name1, params[:fr].try(:strftime, date_format), class: css_class, id: @dom_id) + '</div><div>' +
          datetime_field_tag(@name2, params[:to].try(:strftime, date_format), class: css_class, id: @dom_id2) +
          '</div></div>'
      end

      def has_auto_reloading_calendar? #:nodoc:
        # To be implemented
        false
      end

    end

    class ConditionsGeneratorColumnHtml5Datetimepicker < ConditionsGeneratorColumn  #:nodoc:

      include Wice::Columns::CommonJsDateDatetimeConditionsGeneratorMixin

    end
  end
end
